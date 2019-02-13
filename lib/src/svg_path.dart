import 'dart:math' show Point;

int svgValue(num value) {
  return value.floor();
}

class SvgPath {
  String dataString = '';

  SvgPath();

  void addPolygon(List<Point> points) {
    String ds = 'M${svgValue(points[0].x)} ${svgValue(points[0].y)}';
    for (int i = 0; i < points.length; i++) {
      ds += "L${svgValue(points[i].x)} ${svgValue(points[i].y)}";
    }
    this.dataString += ds + "Z";
  }

  void addCircle(Point point, double diameter, bool counterClockwise) {
    int sweepFlag = counterClockwise != null ? (counterClockwise ? 0 : 1) : 1;
    int svgRadius = svgValue(diameter / 2);
    int svgDiameter = svgValue(diameter);

    this.dataString +=
        'M${svgValue(point.x)} ${svgValue(point.y + diameter / 2)}a$svgRadius,$svgRadius 0 1,$sweepFlag $svgDiameter ,0a$svgRadius,$svgRadius 0 1,$sweepFlag -$svgDiameter,0';
  }
}
