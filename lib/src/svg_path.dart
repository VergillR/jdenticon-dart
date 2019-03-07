import 'dart:math' show Point;

double svgValue(num value) {
  return ((value * 10 + 0.5).floor() / 10);
}

class SvgPath {
  String dataString = '';

  SvgPath();

  void addPolygon(List<Point> points) {
    String ds =
        'M${svgValue(points[0].x).toStringAsFixed(1)} ${svgValue(points[0].y).toStringAsFixed(1)}';
    for (int i = 0; i < points.length; i++) {
      ds +=
          "L${svgValue(points[i].x).toStringAsFixed(1)} ${svgValue(points[i].y).toStringAsFixed(1)}";
    }
    this.dataString += ds + "Z";
  }

  void addCircle(Point point, double diameter, bool counterClockwise) {
    int sweepFlag = counterClockwise != null ? (counterClockwise ? 0 : 1) : 1;
    int svgRadius = (svgValue(diameter / 2)).floor();
    int svgDiameter = (svgValue(diameter)).floor();

    this.dataString +=
        'M${svgValue(point.x)} ${svgValue(point.y + diameter / 2)}a$svgRadius,$svgRadius 0 1,$sweepFlag $svgDiameter ,0a$svgRadius,$svgRadius 0 1,$sweepFlag -$svgDiameter,0';
  }
}
