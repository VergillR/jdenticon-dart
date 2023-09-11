import 'dart:math' show Point;
import 'package:jdenticon_dart/src/renderer.dart';
import 'package:jdenticon_dart/src/svg_path.dart';
import 'package:jdenticon_dart/src/svg_writer.dart';

class SvgRenderer extends Renderer {
  SvgRenderer(this._target) : size = _target.size;
  final Map<String, SvgPath> _pathsByColor = {};
  final SvgWriter _target;
  int size;
  SvgPath _path = SvgPath();

  @override
  void setBackground(String fillColor) {
    if (fillColor.length >= 9) {
      _target.setBackground(
        fillColor.substring(0, 7),
        int.parse(fillColor.substring(7, 9), radix: 16) / 255,
      );
    }
  }

  @override
  void beginShape(String color) {
    final p = _pathsByColor[color];
    if (p != null) {
      _path = p;
    } else {
      _path = _pathsByColor[color] = SvgPath();
    }
  }

  @override
  void endShape() {}

  @override
  void addPolygon(List<Point> points) {
    _path.addPolygon(points);
  }

  @override
  void addCircle(
    Point point,
    double diameter, {
    bool counterClockwise = false,
  }) {
    _path.addCircle(point, diameter, counterClockwise: counterClockwise);
  }

  @override
  void finish() {
    for (final color in _pathsByColor.keys) {
      if (_pathsByColor[color] != null) {
        _target.append(color, _pathsByColor[color]!.dataString);
      }
    }
  }
}
