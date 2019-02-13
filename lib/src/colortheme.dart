import './color.dart';
import './config.dart';

List<String> colorTheme(double h, Config config) {
  return [
    // Dark gray
    Color.hsl(0.0, 0.0, config.grayscaleLightness(0.0)),
    // Mid color
    Color.correctedHsl(h, config.saturation, config.colorLightness(0.5)),
    // Light gray
    Color.hsl(0.0, 0.0, config.grayscaleLightness(1.0)),
    // Light color
    Color.correctedHsl(h, config.saturation, config.colorLightness(1.0)),
    // Dark color
    Color.correctedHsl(h, config.saturation, config.colorLightness(0.0)),
  ];
}
