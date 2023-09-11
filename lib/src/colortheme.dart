import 'package:jdenticon_dart/src/color.dart';
import 'package:jdenticon_dart/src/config.dart';

List<String> colorTheme(double hue, Config config) {
  final h = config.hueFunction(hue);
  return [
    // Dark gray
    Color.correctedHsl(
      h,
      config.grayscaleSaturation,
      config.grayscaleLightness(0),
    ),
    // Mid color
    Color.correctedHsl(h, config.colorSaturation, config.colorLightness(0.5)),
    // Light gray
    Color.correctedHsl(
      h,
      config.grayscaleSaturation,
      config.grayscaleLightness(1),
    ),
    // Light color
    Color.correctedHsl(h, config.colorSaturation, config.colorLightness(1)),
    // Dark color
    Color.correctedHsl(h, config.colorSaturation, config.colorLightness(0)),
  ];
}
