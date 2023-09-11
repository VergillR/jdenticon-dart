import 'dart:convert' show utf8;

import 'package:crypto/crypto.dart' show sha1;
import 'package:jdenticon_dart/src/color.dart';
import 'package:jdenticon_dart/src/config.dart';
import 'package:jdenticon_dart/src/icon_generator.dart';
import 'package:jdenticon_dart/src/svg_renderer.dart';
import 'package:jdenticon_dart/src/svg_writer.dart';

class Jdenticon {
  Jdenticon();

  /// The entry request for which Jdenticon creates a SVG in the form of a SVG-string
  ///
  /// This library creates personalized icons or identicons as close as possible as defined by the Jdenticon project (https://jdenticon.com).
  /// Jdenticon only returns the raw SVG string. This raw SVG string needs to be passed to a widget to be actually rendered.
  /// SvgPicture is a widget provided by flutter_svg that can convert raw SVG strings to real images.
  /// See the example.dart in the example folder to see how easy this is done in Flutter.
  /// toSvg requires a [message] to be used as base for the identicon. The [size] is optional and there is usually no need to change it because SvgPicture handles the sizing and scaling when the icon is actually rendered.
  /// The [padding] is also optional; the default is no padding and it is generally not needed as SvgPicture or the parent widget controlling it, will set the paddings and margins.
  /// To make customized icons, override the values of the settings you want to change: [colorLightnessMinValue], [colorLightnessMaxValue], [grayscaleLightnessMinValue], [grayscaleLightnessMaxValue], [colorSaturation], [grayscaleSaturation], [backColor], [hues]
  /// Note that a given [backColor] should be in #rrggbbaa format and is transparent by default. E.g. to make it opaque white, set it to '#FFFFFFFF'.
  /// [hues] should be an array with one (or more) int values
  static String toSvg(
    String message, {
    int size = 64,
    double padding = 0.08,
    double colorLightnessMinValue = 0.4,
    double colorLightnessMaxValue = 0.8,
    double grayscaleLightnessMinValue = 0.3,
    double grayscaleLightnessMaxValue = 0.9,
    double colorSaturation = 0.5,
    double grayscaleSaturation = 0.0,
    String backColor = '',
    List<int> hues = const <int>[],
  }) {
    final hash = '${sha1.convert(utf8.encode(message))}';
    final writer = SvgWriter(size.abs());
    final s = size.abs().toDouble();
    final renderer = SvgRenderer(writer);
    IconGenerator(
      renderer,
      hash,
      0,
      0,
      s,
      padding,
      getCurrentConfig(
        colorLightnessMinValue: colorLightnessMinValue,
        colorLightnessMaxValue: colorLightnessMaxValue,
        grayscaleLightnessMinValue: grayscaleLightnessMinValue,
        grayscaleLightnessMaxValue: grayscaleLightnessMaxValue,
        colorSaturation: colorSaturation,
        grayscaleSaturation: grayscaleSaturation,
        backColor: backColor,
        hues: hues,
      ),
    );
    return writer.convertToString();
  }

  /// Returns the current configuration constant settings used by Jdenticon
  static Config getCurrentConfig({
    double colorLightnessMinValue = 0.4,
    double colorLightnessMaxValue = 0.8,
    double grayscaleLightnessMinValue = 0.3,
    double grayscaleLightnessMaxValue = 0.9,
    double colorSaturation = 0.5,
    double grayscaleSaturation = 0.0,
    String backColor = '',
    List<int> hues = const <int>[],
  }) {
    double Function(double) lightness(
      String configName,
      double defaultMin,
      double defaultMax,
    ) {
      final range = <double>[defaultMin, defaultMax];

      return (double value) {
        final value2 = range[0] + value * (range[1] - range[0]);
        return value2 < 0.0 ? 0.0 : (value2 > 1.0 ? 1.0 : value2);
      };
    }

    return Config(
      colorSaturation.clamp(0.0, 1.0),
      grayscaleSaturation.clamp(0.0, 1.0),
      lightness('color', colorLightnessMinValue, colorLightnessMaxValue),
      lightness(
        'grayscale',
        grayscaleLightnessMinValue,
        grayscaleLightnessMaxValue,
      ),
      Color.parse(backColor),
      hues,
    );
  }
}
