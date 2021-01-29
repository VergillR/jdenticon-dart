import 'dart:math' show Point;

abstract class Renderer {
  void setBackground(String fillColor);
  void beginShape(String color);
  void endShape();
  void addPolygon(List<Point> points);
  void addCircle(Point point, double diameter, {bool counterClockwise});
  void finish();
}
