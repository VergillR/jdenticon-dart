import 'dart:math' show Point;
import 'package:jdenticon_dart/src/graphics.dart';

List<Function> center = [
  (Graphics g, double cell, [int index = 0]) {
    final k = cell * 0.42;
    g.addPolygon([
      const Point(0.0, 0.0),
      Point(cell, 0.0),
      Point(cell, cell - k * 2.0),
      Point(cell - k, cell),
      Point(0.0, cell),
    ]);
  },
  (Graphics g, double cell, [int index = 0]) {
    final w = (cell * 0.5).floorToDouble();
    final h = (cell * 0.8).floorToDouble();
    g.addTriangle(cell - w, 0.0, w, h, 2.0);
  },
  (Graphics g, double cell, [int index = 0]) {
    final s = (cell / 3.0).floorToDouble();
    g.addRectangle(s, s, cell - s, cell - s);
  },
  (Graphics g, double cell, [int index = 0]) {
    var inner = cell * 0.1;
    inner = inner > 1 ? inner.floorToDouble() : (inner > 0.5 ? 1.0 : inner);

    final outer = cell < 6.0 ? 1.0 : (cell < 8.0 ? 2.0 : (cell * 0.25).floorToDouble());
    g.addRectangle(outer, outer, cell - inner - outer, cell - inner - outer);
  },
  (Graphics g, double cell, [int index = 0]) {
    final m = (cell * 0.15).floorToDouble();
    final s = (cell * 0.5).floorToDouble();
    g.addCircle(cell - s - m, cell - s - m, s);
  },
  (Graphics g, double cell, [int index = 0]) {
    final inner = cell * 0.1;
    var outer = inner * 4.0;
    if (outer > 3) {
      outer = outer.floorToDouble();
    }

    g
      ..addRectangle(0.0, 0.0, cell, cell)
      ..addPolygon(
        [
          Point(outer, outer.floorToDouble()),
          Point(cell - inner, outer.floorToDouble()),
          Point(outer + (cell - outer - inner) / 2.0, cell - inner),
        ],
        invert: true,
      );
  },
  (Graphics g, double cell, [int index = 0]) {
    g.addPolygon([
      const Point(0.0, 0.0),
      Point(cell, 0.0),
      Point(cell, cell * 0.7),
      Point(cell * 0.4, cell * 0.4),
      Point(cell * 0.7, cell),
      Point(0.0, cell),
    ]);
  },
  (Graphics g, double cell, [int index = 0]) {
    g.addTriangle(cell / 2, cell / 2, cell / 2, cell / 2, 3);
  },
  (Graphics g, double cell, [int index = 0]) {
    g
      ..addRectangle(0, 0, cell, cell / 2)
      ..addRectangle(0, cell / 2, cell / 2, cell / 2)
      ..addTriangle(cell / 2, cell / 2, cell / 2, cell / 2, 1);
  },
  (Graphics g, double cell, [int index = 0]) {
    var inner = cell * 0.14;
    inner = cell < 8 ? inner : inner.floorToDouble();

    final outer = cell < 4 ? 1 : (cell < 6 ? 2 : (cell * 0.35).floorToDouble());

    g
      ..addRectangle(0, 0, cell, cell)
      ..addRectangle(
        outer,
        outer,
        cell - outer - inner,
        cell - outer - inner,
        invert: true,
      );
  },
  (Graphics g, double cell, [int index = 0]) {
    final inner = cell * 0.12;
    final outer = inner * 3;

    g
      ..addRectangle(0, 0, cell, cell)
      ..addCircle(outer, outer, cell - inner - outer, invert: true);
  },
  (Graphics g, double cell, [int index = 0]) {
    g.addTriangle(cell / 2, cell / 2, cell / 2, cell / 2, 3);
  },
  (Graphics g, double cell, [int index = 0]) {
    final m = cell * 0.25;
    g
      ..addRectangle(0, 0, cell, cell)
      ..addRhombus(m, m, cell - m, cell - m, invert: true);
  },
  (Graphics g, double cell, [int index = 0]) {
    final m = cell * 0.4;
    final s = cell * 1.2;
    if (index == 0) {
      g.addCircle(m, m, s);
    }
  }
];

List<Function> outer = [
  (Graphics g, double cell, [int index = 0]) {
    g.addTriangle(0.0, 0.0, cell, cell, 0.0);
  },
  (Graphics g, double cell, [int index = 0]) {
    g.addTriangle(0.0, cell / 2.0, cell, cell / 2.0, 0.0);
  },
  (Graphics g, double cell, [int index = 0]) {
    g.addRhombus(0.0, 0.0, cell, cell);
  },
  (Graphics g, double cell, [int index = 0]) {
    final m = cell / 6.0;
    g.addCircle(m, m, cell - 2 * m);
  }
];
