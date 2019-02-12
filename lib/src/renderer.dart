import 'dart:math' show Point;

abstract class Renderer {
  setBackground(String fillColor);
  beginShape(String color);
  endShape();
  addPolygon(List<Point> points);
  addCircle(Point point, double diameter, bool counterClockwise);
  finish();
}