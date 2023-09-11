import 'dart:math' show Point;
import 'package:jdenticon_dart/src/renderer.dart';
import 'package:jdenticon_dart/src/transform.dart';

class Graphics {
  Graphics(this._renderer);
  final Renderer _renderer;
  Transform transform = Transform.noTransform();

  void addPolygon(List<Point> points, {bool invert = false}) {
    final tf = transform;
    final transformedPoints = <Point>[];
    var i = invert ? points.length - 1 : 0;
    if (!invert) {
      for (; i < points.length; i++) {
        transformedPoints.add(
          tf.transformPoint(points[i].x as double, points[i].y as double),
        );
      }
    } else {
      for (; i > -1; i--) {
        transformedPoints.add(
          tf.transformPoint(points[i].x as double, points[i].y as double),
        );
      }
    }
    _renderer.addPolygon(transformedPoints);
  }

  void addCircle(num xx, num yy, num s, {bool invert = false}) {
    final x = xx.toDouble();
    final y = yy.toDouble();
    final size = s.toDouble();
    final p = transform.transformPoint(x, y, size, size);
    _renderer.addCircle(p, size, counterClockwise: invert);
  }

  void addRectangle(num xx, num yy, num ww, num hh, {bool invert = false}) {
    final x = xx.toDouble();
    final y = yy.toDouble();
    final w = ww.toDouble();
    final h = hh.toDouble();
    addPolygon(
      [Point(x, y), Point(x + w, y), Point(x + w, y + h), Point(x, y + h)],
      invert: invert,
    );
  }

  void addTriangle(
    num xx,
    num yy,
    num ww,
    num hh,
    num r, {
    bool invert = false,
  }) {
    final x = xx.toDouble();
    final y = yy.toDouble();
    final w = ww.toDouble();
    final h = hh.toDouble();
    final points = <Point>[
      Point(x + w, y),
      Point(x + w, y + h),
      Point(x, y + h),
      Point(x, y),
    ]..removeAt(r.floor() % 4);
    addPolygon(points, invert: invert);
  }

  void addRhombus(num xx, num yy, num ww, num hh, {bool invert = false}) {
    final x = xx.toDouble();
    final y = yy.toDouble();
    final w = ww.toDouble();
    final h = hh.toDouble();
    addPolygon(
      [
        Point(x + w / 2.0, y),
        Point(x + w, y + h / 2.0),
        Point(x + w / 2.0, y + h),
        Point(x, y + h / 2.0),
      ],
      invert: invert,
    );
  }
}
