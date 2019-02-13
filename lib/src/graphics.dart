import 'dart:math' show Point;
import './renderer.dart';
import './transform.dart';

class Graphics {
  Renderer _renderer;
  Transform transform = Transform.noTransform();

  Graphics(this._renderer);

  void addPolygon(List<Point> points, [bool invert = false]) {
    Transform tf = this.transform;
    List<Point> transformedPoints = [];
    int i = invert == true ? points.length - 1 : 0;
    if (!invert) {
      for (i; i < points.length; i++) {
        transformedPoints.add(tf.transformPoint(points[i].x, points[i].y));
      }
    } else {
      for (i; i > -1; i--) {
        transformedPoints.add(tf.transformPoint(points[i].x, points[i].y));
      }
    }
    this._renderer.addPolygon(transformedPoints);
  }

  void addCircle(num xx, num yy, num s, [bool invert = false]) {
    double x = xx.toDouble();
    double y = yy.toDouble();
    double size = s.toDouble();
    Point<num> p = this.transform.transformPoint(x, y, size, size);
    this._renderer.addCircle(p, size, invert);
  }

  void addRectangle(num xx, num yy, num ww, num hh, [bool invert = false]) {
    double x = xx.toDouble();
    double y = yy.toDouble();
    double w = ww.toDouble();
    double h = hh.toDouble();
    this.addPolygon(
        [Point(x, y), Point(x + w, y), Point(x + w, y + h), Point(x, y + h)],
        invert);
  }

  void addTriangle(num xx, num yy, num ww, num hh, num r, [bool invert = false]) {
    double x = xx.toDouble();
    double y = yy.toDouble();
    double w = ww.toDouble();
    double h = hh.toDouble();
    List<Point> points = [
      Point(x + w, y),
      Point(x + w, y + h),
      Point(x, y + h),
      Point(x, y)
    ];
    points.removeAt(r.floor() % 4);
    this.addPolygon(points, invert);
  }

  void addRhombus(num xx, num yy, num ww, num hh, [bool invert = false]) {
    double x = xx.toDouble();
    double y = yy.toDouble();
    double w = ww.toDouble();
    double h = hh.toDouble();
    this.addPolygon([
      Point(x + w / 2.0, y),
      Point(x + w, y + h / 2.0), 
      Point(x + w / 2.0, y + h), 
      Point(x, y + h / 2.0)
    ],
    invert);
  }
}