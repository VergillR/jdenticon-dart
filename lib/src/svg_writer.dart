class SvgWriter {
  final int size;
  String _s;

  SvgWriter(this.size) {
    _s = '<svg xmlns="http://www.w3.org/2000/svg" width="$size" height="$size" viewBox="0 0 $size $size" preserveAspectRatio="xMidYMid meet">';
  }

  void setBackground(String fillColor, [double opacity]) {
    if (opacity != null) {
      this._s += '<rect width="100%" height="100%" fill="$fillColor" opacity="${opacity.toStringAsFixed(2)}" />';
    }
  }

  void append(String color, String dataString) {
    this._s += '<path fill="$color" d="$dataString" />';
  }

  String convertToString() {
    return this._s + '</svg>';
  }
}