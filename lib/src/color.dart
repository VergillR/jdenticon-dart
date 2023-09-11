import 'package:meta/meta.dart';

@immutable
final class Color {
  const Color._();

  static String decToHex(num vv) {
    final v = vv.toInt();
    return v <= 0
        ? '00'
        : v < 16
            ? '0${v.toRadixString(16)}'
            : v < 256
                ? v.toRadixString(16)
                : 'ff';
  }

  static String hueToRgb(double m1, double m2, double h) {
    final h2 = h < 0
        ? h + 6
        : h > 6
            ? h - 6
            : h;
    return decToHex(
      255 *
          (h2 < 1
              ? m1 + (m2 - m1) * h2
              : h2 < 3
                  ? m2
                  : h2 < 4
                      ? m1 + (m2 - m1) * (4 - h2)
                      : m1),
    );
  }

  static String rgb(double r, double g, double b) => '#${Color.decToHex(r)}${Color.decToHex(g)}${Color.decToHex(b)}';

  static String parse(String color) {
    final test = RegExp(r'^#[0-9a-f]{3,8}$', caseSensitive: false);
    if (test.hasMatch(color)) {
      if (color.length < 6) {
        final r = color[1];
        final g = color[2];
        final b = color[3];
        final a = color.length > 4 ? color[4] : '';
        return '#$r$r$g$g$b$b$a$a';
      } else if (color.length == 7 || color.length > 8) {
        return color;
      }
    }
    return '#000000';
  }

  static String toCss3(String hexColor) {
    var a = 1;
    try {
      a = int.parse(hexColor.substring(7, 9), radix: 16);
    } catch (e) {
      return hexColor;
    }

    final r = int.parse(hexColor.substring(1, 3), radix: 16);
    final g = int.parse(hexColor.substring(3, 5), radix: 16);
    final b = int.parse(hexColor.substring(5, 7), radix: 16);
    return 'rgba($r,$g,$b,${(a / 255).toStringAsFixed(2)})';
  }

  static String hsl(double h, double s, double l) {
    if (s == 0.0) {
      final partialHex = Color.decToHex(255 * l);
      return '#$partialHex$partialHex$partialHex';
    } else {
      final m2 = l <= 0.5 ? l * (s + 1) : l + s - (l * s);
      final m1 = (l * 2) - m2;
      return '#${Color.hueToRgb(m1, m2, h * 6 + 2)}${Color.hueToRgb(m1, m2, h * 6)}${Color.hueToRgb(m1, m2, h * 6 - 2)}';
    }
  }

  static String correctedHsl(double h, double s, double l) {
    final correctors = <double>[0.55, 0.5, 0.5, 0.46, 0.6, 0.55, 0.55];
    final corrector = correctors[(h * 6 + 0.5).floor()];
    return Color.hsl(
      h,
      s,
      l < 0.5 ? l * corrector * 2 : corrector + (l - 0.5) * (1 - corrector) * 2,
    );
  }
}
