import 'dart:math' show Point;

class Transform {
  double _x;
  double _y;
  double _size;
  double _rotation;

  Transform(this._x, this._y, this._size, this._rotation);

  Point transformPoint(double x, double y, [double w, double h]) {
    double right = this._x + this._size;
    double bottom = this._y + this._size;
    double height = h != null ? h : 0;
    double width = w != null ? w : 0;
    return this._rotation == 1
        ? Point(right - y - height, this._y + x)
        : this._rotation == 2
            ? Point(right - x - width, bottom - y - height)
            : this._rotation == 3
                ? Point(this._x + y, bottom - x - width)
                : Point(this._x + x, this._y + y);
  }

  static Transform noTransform() {
    return Transform(0, 0, 0, 0);
  }
}
