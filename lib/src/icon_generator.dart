import 'package:jdenticon_dart/src/colortheme.dart';
import 'package:jdenticon_dart/src/config.dart';
import 'package:jdenticon_dart/src/graphics.dart';
import 'package:jdenticon_dart/src/shapes.dart' as shapes;
import 'package:jdenticon_dart/src/svg_renderer.dart';
import 'package:jdenticon_dart/src/transform.dart';

class IconGenerator {
  IconGenerator(
    SvgRenderer renderer,
    String hash,
    double x,
    double y,
    double size,
    double padding,
    Config config,
  ) {
    _renderer = renderer;
    renderer.setBackground(config.backColor);
    _hash = hash;

    _padding = (0.5 + size * padding).floor();
    _size = (size - _padding * 2).floor().abs();

    cell = (_size / 4.0).floor();

    _x = x + (_padding + _size / 2.0 - cell * 2.0).floorToDouble();
    _y = y + (_padding + _size / 2.0 - cell * 2.0).floorToDouble();

    hue = int.parse(hash.substring(hash.length - 7), radix: 16) / 0xfffffff;
    availableColors = colorTheme(hue.toDouble(), config);
    graphics = Graphics(renderer);

    for (var i = 0; i < 3; i++) {
      index = int.parse(hash.substring(8 + i, 9 + i), radix: 16) % availableColors.length;
      if (isDuplicate(<int>[0, 4]) || // Disallow dark gray and dark color combo
          isDuplicate(<int>[2, 3])) {
        // Disallow light gray and light color combo
        index = 1;
      }
      selectedColorIndexes.add(index);
    }

    // Sides
    renderShape(0, shapes.outer, 2, 3, [
      [1, 0],
      [2, 0],
      [2, 3],
      [1, 3],
      [0, 1],
      [3, 1],
      [3, 2],
      [0, 2],
    ]);
    // Corners
    renderShape(1, shapes.outer, 4, 5, [
      [0, 0],
      [3, 0],
      [3, 3],
      [0, 3],
    ]);
    // Center
    renderShape(2, shapes.center, 1, null, [
      [1, 1],
      [2, 1],
      [2, 2],
      [1, 2],
    ]);
    _renderer!.finish();
  }
  String _hash = '';
  SvgRenderer? _renderer;
  int _padding = 0;
  int _size = 0;
  double _x = 0;
  double _y = 0;
  int cell = 0;
  num hue = 0;
  List<String> availableColors = <String>[];
  List<int> selectedColorIndexes = <int>[];
  int index = 0;
  Graphics? graphics;

  bool isDuplicate(List<int> values) {
    if (values.contains(index)) {
      for (var i = 0; i < values.length; i++) {
        if (selectedColorIndexes.contains(values[i])) {
          return true;
        }
      }
    }
    return false;
  }

  void renderShape(
    int colorIndex,
    List<Function> shapes,
    int index,
    int? rotationIndex,
    List<List<int>> positions,
  ) {
    final renderer = _renderer;
    final gr = graphics;
    if (renderer != null && gr != null) {
      var r = rotationIndex != null
          ? int.parse(
              _hash.substring(rotationIndex, rotationIndex + 1),
              radix: 16,
            )
          : 0;
      final shape = shapes[int.parse(_hash.substring(index, index + 1), radix: 16) % shapes.length];

      renderer.beginShape(availableColors[selectedColorIndexes[colorIndex]]);
      for (var i = 0; i < positions.length; i++) {
        gr.transform = Transform(
          _x + positions[i][0] * cell,
          _y + positions[i][1] * cell,
          cell.toDouble(),
          (r++ % 4).toDouble(),
        );
        // ignore: avoid_dynamic_calls
        shape(graphics, cell.toDouble(), i);
      }
      renderer.endShape();
    }
  }
}
