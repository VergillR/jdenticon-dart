import './color.dart';
import './config.dart';

List<String> colorTheme(double hue, Config config) {
  final double h = config.hueFunction(hue);
  return [
    // Dark gray
    Color.correctedHsl(
        h, config.grayscaleSaturation, config.grayscaleLightness(0.0)),
    // Mid color
    Color.correctedHsl(h, config.colorSaturation, config.colorLightness(0.5)),
    // Light gray
    Color.correctedHsl(
        h, config.grayscaleSaturation, config.grayscaleLightness(1.0)),
    // Light color
    Color.correctedHsl(h, config.colorSaturation, config.colorLightness(1.0)),
    // Dark color
    Color.correctedHsl(h, config.colorSaturation, config.colorLightness(0.0)),
  ];
}
