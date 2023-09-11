class SvgWriter {
  SvgWriter(this.size)
      : _s =
            '<svg xmlns="http://www.w3.org/2000/svg" width="$size" height="$size" viewBox="0 0 $size $size" preserveAspectRatio="xMidYMid meet">';
  final int size;

  String _s;

  void setBackground(String fillColor, double opacity) {
    _s +=
        '<rect width="$size" height="$size" fill="$fillColor" opacity="${opacity.toStringAsFixed(2)}" />';
  }

  void append(String color, String dataString) {
    _s += '<path fill="$color" d="$dataString" />';
  }

  String convertToString() => '$_s</svg>';
}
