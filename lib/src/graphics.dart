import 'dart:math' show Point;
import './renderer.dart';
import './transform.dart';

class Graphics {
  final Renderer _renderer;
  Transform transform = Transform.noTransform();

  Graphics(this._renderer);

  void addPolygon(List<Point> points, {bool invert = false}) {
    final Transform tf = transform;
    final List<Point> transformedPoints = [];
    int i = invert ? points.length - 1 : 0;
    if (!invert) {
      for (; i < points.length; i++) {
        transformedPoints.add(
            tf.transformPoint(points[i].x as double, points[i].y as double));
      }
    } else {
      for (; i > -1; i--) {
        transformedPoints.add(
            tf.transformPoint(points[i].x as double, points[i].y as double));
      }
    }
    _renderer.addPolygon(transformedPoints);
  }

  void addCircle(num xx, num yy, num s, {bool invert = false}) {
    final double x = xx.toDouble();
    final double y = yy.toDouble();
    final double size = s.toDouble();
    final Point<num> p = transform.transformPoint(x, y, size, size);
    _renderer.addCircle(p, size, counterClockwise: invert);
  }

  void addRectangle(num xx, num yy, num ww, num hh, {bool invert = false}) {
    final double x = xx.toDouble();
    final double y = yy.toDouble();
    final double w = ww.toDouble();
    final double h = hh.toDouble();
    addPolygon(
        [Point(x, y), Point(x + w, y), Point(x + w, y + h), Point(x, y + h)],
        invert: invert);
  }

  void addTriangle(num xx, num yy, num ww, num hh, num r,
      {bool invert = false}) {
    final double x = xx.toDouble();
    final double y = yy.toDouble();
    final double w = ww.toDouble();
    final double h = hh.toDouble();
    final List<Point> points = [
      Point(x + w, y),
      Point(x + w, y + h),
      Point(x, y + h),
      Point(x, y)
    ];
    points.removeAt(r.floor() % 4);
    addPolygon(points, invert: invert);
  }

  void addRhombus(num xx, num yy, num ww, num hh, {bool invert = false}) {
    final double x = xx.toDouble();
    final double y = yy.toDouble();
    final double w = ww.toDouble();
    final double h = hh.toDouble();
    addPolygon([
      Point(x + w / 2.0, y),
      Point(x + w, y + h / 2.0),
      Point(x + w / 2.0, y + h),
      Point(x, y + h / 2.0)
    ], invert: invert);
  }
}
