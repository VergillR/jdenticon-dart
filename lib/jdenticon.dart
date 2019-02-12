library jdenticon;

import 'package:crypto/crypto.dart' show sha1;
import 'dart:convert' show utf8;

import 'src/color.dart';
import 'src/config.dart';
import 'src/icon_generator.dart';
import 'src/svg_renderer.dart';
import 'src/svg_writer.dart';

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
  static String toSvg(String message, [int size = 64, double padding]) {
    final String hash = '${sha1.convert(utf8.encode(message))}';
    SvgWriter writer = SvgWriter(size.abs());
    final double s = size.abs().toDouble();
    SvgRenderer renderer = SvgRenderer(writer);
    IconGenerator(
      renderer,
      hash,
      0.0,
      0.0,
      s,
      padding,
      getCurrentConfig()
    );
    return writer.convertToString();
  }

  /// Returns the current configuration constant settings used by Jdenticon
  static Config getCurrentConfig() {
    final String backColor = "#FFFFFF";
    
    Function lightness(String configName, double defaultMin, double defaultMax) {
      List<double> range = [defaultMin, defaultMax];

      return (double value) {
        double value2 = range[0] + value * (range[1] - range[0]);
        return value2 < 0.0 ? 0.0 : (value2 > 1.0 ? 1.0 : value2);
      };
    }

    return Config(0.5, lightness("color", 0.4, 0.8), lightness("grayscale", 0.3, 0.9), Color.cparse(backColor));
  }
}
