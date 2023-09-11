import 'dart:math' show Point;

class Transform {
  Transform(this._x, this._y, this._size, this._rotation);

  Transform.noTransform()
      : _x = 0,
        _y = 0,
        _size = 0,
        _rotation = 0;
  final double _x;
  final double _y;
  final double _size;
  final double _rotation;

  Point transformPoint(
    double x,
    double y, [
    double width = 0.0,
    double height = 0.0,
  ]) {
    final right = _x + _size;
    final bottom = _y + _size;

    return _rotation == 1
        ? Point(right - y - height, _y + x)
        : _rotation == 2
            ? Point(right - x - width, bottom - y - height)
            : _rotation == 3
                ? Point(_x + y, bottom - x - width)
                : Point(_x + x, _y + y);
  }
}
