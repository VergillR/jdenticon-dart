import 'dart:math' show Point;
import './renderer.dart';
import './svg_path.dart';
import './svg_writer.dart';

class SvgRenderer extends Renderer {
  Map<String, SvgPath> _pathsByColor = {};
  SvgWriter _target;
  int size;
  SvgPath _path = SvgPath();

  SvgRenderer(this._target) {
    this.size = this._target.size;
  }

  void setBackground(String fillColor) {
    final String color =
        fillColor.length < 9 ? fillColor : fillColor.substring(0, 6);
    final int opacity = fillColor.length < 9
        ? null
        : int.parse(fillColor.substring(6, 8), radix: 16);
    this._target.setBackground(color, opacity?.toDouble());
  }

  void beginShape(String color) {
    this._path = this._pathsByColor[color] != null
        ? this._pathsByColor[color]
        : (this._pathsByColor[color] = SvgPath());
  }

  void endShape() {}

  void addPolygon(List<Point> points) {
    this._path.addPolygon(points);
  }

  void addCircle(Point point, double diameter, bool counterClockwise) {
    this._path.addCircle(point, diameter, counterClockwise);
  }

  void finish() {
    for (String color in this._pathsByColor.keys) {
      this._target.append(color, this._pathsByColor[color]?.dataString);
    }
  }
}
