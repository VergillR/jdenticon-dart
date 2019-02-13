import 'dart:math' show Point;
import './graphics.dart';

class Shapes {
  static List<Function> center = [
    (Graphics g, double cell, [int index]) {
      double k = cell * 0.42;
      g.addPolygon([
        Point(0.0, 0.0),
        Point(cell, 0.0),
        Point(cell, cell - k * 2.0),
        Point(cell - k, cell),
        Point(0.0, cell)
      ]);
    },
    (Graphics g, double cell, [int index]) {
      double w = (cell * 0.5).floorToDouble();
      double h = (cell * 0.8).floorToDouble();
      g.addTriangle(cell - w, 0.0, w, h, 2.0);
    },
    (Graphics g, double cell, [int index]) {
      double s = (cell / 3.0).floorToDouble();
      g.addRectangle(s, s, cell - s, cell - s);
    },
    (Graphics g, double cell, [int index]) {
      double inner = cell * 0.1;
      inner = inner > 1 ? inner.floorToDouble() : (inner > 0.5 ? 1.0 : inner);

      double outer =
          cell < 6.0 ? 1.0 : (cell < 8.0 ? 2.0 : (cell * 0.25).floorToDouble());
      g.addRectangle(outer, outer, cell - inner - outer, cell - inner - outer);
    },
    (Graphics g, double cell, [int index]) {
      double m = (cell * 0.15).floorToDouble();
      double s = (cell * 0.5).floorToDouble();
      g.addCircle(cell - s - m, cell - s - m, s);
    },
    (Graphics g, double cell, [int index]) {
      double inner = cell * 0.1;
      double outer = inner * 4.0;
      if (outer > 3) {
        outer = outer.floorToDouble();
      }

      g.addRectangle(0.0, 0.0, cell, cell);
      g.addPolygon([
        Point(outer, outer.floorToDouble()),
        Point(cell - inner, outer.floorToDouble()),
        Point(outer + (cell - outer - inner) / 2.0, cell - inner)
      ], true);
    },
    (Graphics g, double cell, [int index]) {
      g.addPolygon([
        Point(0.0, 0.0),
        Point(cell, 0.0),
        Point(cell, cell * 0.7),
        Point(cell * 0.4, cell * 0.4),
        Point(cell * 0.7, cell),
        Point(0.0, cell)
      ]);
    },
    (Graphics g, double cell, [int index]) {
      g.addTriangle(cell / 2, cell / 2, cell / 2, cell / 2, 3);
    },
    (Graphics g, double cell, [int index]) {
      g.addRectangle(0, 0, cell, cell / 2);
      g.addRectangle(0, cell / 2, cell / 2, cell / 2);
      g.addTriangle(cell / 2, cell / 2, cell / 2, cell / 2, 1);
    },
    (Graphics g, double cell, [int index]) {
      double inner = cell * 0.14;
      inner = cell < 8 ? inner : inner.floorToDouble();

      double outer =
          cell < 4 ? 1 : (cell < 6 ? 2 : (cell * 0.35).floorToDouble());

      g.addRectangle(0, 0, cell, cell);
      g.addRectangle(
          outer, outer, cell - outer - inner, cell - outer - inner, true);
    },
    (Graphics g, double cell, [int index]) {
      double inner = cell * 0.12;
      double outer = inner * 3;

      g.addRectangle(0, 0, cell, cell);
      g.addCircle(outer, outer, cell - inner - outer, true);
    },
    (Graphics g, double cell, [int index]) {
      g.addTriangle(cell / 2, cell / 2, cell / 2, cell / 2, 3);
    },
    (Graphics g, double cell, [int index]) {
      double m = cell * 0.25;
      g.addRectangle(0, 0, cell, cell);
      g.addRhombus(m, m, cell - m, cell - m, true);
    },
    (Graphics g, double cell, [int index]) {
      double m = cell * 0.4;
      double s = cell * 1.2;
      if (index == null || index == 0) {
        g.addCircle(m, m, s);
      }
    }
  ];

  static List<Function> outer = [
    (Graphics g, double cell, [int index]) {
      g.addTriangle(0.0, 0.0, cell, cell, 0.0);
    },
    (Graphics g, double cell, [int index]) {
      g.addTriangle(0.0, cell / 2.0, cell, cell / 2.0, 0.0);
    },
    (Graphics g, double cell, [int index]) {
      g.addRhombus(0.0, 0.0, cell, cell);
    },
    (Graphics g, double cell, [int index]) {
      double m = cell / 6.0;
      g.addCircle(m, m, cell - 2 * m);
    }
  ];
}
