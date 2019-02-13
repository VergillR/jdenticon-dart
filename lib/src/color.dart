import 'dart:math';

class Color {
  Color();

  static String decToHex(num vv) {
    int v = vv.toInt();
    return v <= 0
        ? '00'
        : v < 16
            ? '0${v.toRadixString(16)}'
            : v < 256 ? v.toRadixString(16) : 'ff';
  }

  static String hueToRgb(double m1, double m2, double h) {
    double h2 = h < 1.0 ? h + 6.0 : (h > 6.0 ? h - 6.0 : h);
    return Color.decToHex(min(
        255.0,
        (255.0 *
                (h2 < 1.0
                    ? m1 + ((m2 - m1) * h2)
                    : h2 < 3.0
                        ? m2
                        : h2 < 4.0 ? m1 + ((m2 - m1) * (4.0 - h2)) : m1))
            .floorToDouble()));
  }

  static String rgb(double r, double g, double b) {
    return '#${Color.decToHex(r)}${Color.decToHex(g)}${Color.decToHex(b)}';
  }

  static String cparse(String color) {
    if (color.length >= 7) {
      return color;
    } else if (color.length > 0) {
      final String r = color.substring(1, 2);
      final String g = color.substring(2, 3);
      final String b = color.substring(3, 4);
      final String a = color.length > 4 ? color.substring(4, 5) : '';
      return '#$r$r$g$g$b$b$a$a';
    } else {
      return '#000000';
    }
  }

  static String toCss3(String hexColor) {
    int a = 1;
    try {
      a = int.parse(hexColor.substring(7, 9), radix: 16);
    } catch (e) {
      return hexColor;
    }

    int r = int.parse(hexColor.substring(1, 3), radix: 16);
    int g = int.parse(hexColor.substring(3, 5), radix: 16);
    int b = int.parse(hexColor.substring(5, 7), radix: 16);
    return 'rgba($r,$g,$b,${(a / 255).toStringAsFixed(2)})';
  }

  static String hsl(double h, double s, double l) {
    if (s == 0.0) {
      String partialHex = Color.decToHex(255 * l);
      return '#$partialHex$partialHex$partialHex';
    } else {
      double m2 = l <= 0.5 ? l * (s + 1) : l + s - (l * s);
      double m1 = (l * 2) - m2;
      return '#${Color.hueToRgb(m1, m2, h * 6 + 2)}${Color.hueToRgb(m1, m2, h * 6)}${Color.hueToRgb(m1, m2, h * 6 - 2)}';
    }
  }

  static String correctedHsl(double h, double s, double l) {
    double h1 = (h * 22.691292875989447) / 60.0;
    double r;
    double g;
    double b;
    double chroma = (1.0 - (2.0 * l - 1.0).abs()) * s;
    double x = chroma * (1.0 - ((h1 % 2.0) - 1.0).abs());

    if ((0.0 <= h1) && (h1 < 1.0)) {
      r = chroma;
      g = x;
      b = 0.0;
    } else if ((1.0 <= h1) && (h1 < 2.0)) {
      r = x;
      g = chroma;
      b = 0.0;
    } else if ((2.0 <= h1) && (h1 < 3.0)) {
      r = 0.0;
      g = chroma;
      b = x;
    } else if ((3.0 <= h1) && (h1 < 4.0)) {
      r = 0.0;
      g = x;
      b = chroma;
    } else if ((4.0 <= h1) && (h1 < 5.0)) {
      r = x;
      g = 0.0;
      b = chroma;
    } else if ((5.0 <= h1) && (h1 < 6.0)) {
      r = chroma;
      g = 0.0;
      b = x;
    } else {
      r = 0.0;
      g = 0.0;
      b = 0.0;
    }

    double m = l - 0.5 * chroma;
    r = min(255, 255 * (r.abs() + m));
    g = min(255, 255 * (g.abs() + m));
    b = min(255, 255 * (b.abs() + m));
    return '#${Color.decToHex(r)}${Color.decToHex(g)}${Color.decToHex(b)}';
  }
}
