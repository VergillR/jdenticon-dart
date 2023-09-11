class Config {
  Config(
    this.colorSaturation,
    this.grayscaleSaturation,
    this.colorLightness,
    this.grayscaleLightness,
    this.backColor,
    this.hues,
  );
  final double colorSaturation;
  final double grayscaleSaturation;
  double Function(double) colorLightness;
  double Function(double) grayscaleLightness;
  final String backColor;
  List<int> hues;

  double hueFunction(double originalHue) {
    final hueConfig = hues;
    var hue = -1;
    // Check if 'hues' is an array-like object. This way we also ensure that
    // the array is not empty, which would mean no hue restriction.
    if (hueConfig.isNotEmpty) {
      // originalHue is in the range [0, 1]
      // Multiply with 0.999 to change the range to [0, 1) and then truncate the index.
      hue = hueConfig[(0.999 * originalHue * hueConfig.length).floor()];
    }

    return hue != -1
        ?
        // A hue was specified. We need to convert the hue from
        // degrees on any turn - e.g. 746° is a perfectly valid hue -
        // to turns in the range [0, 1).
        ((((hue / 360) % 1) + 1) % 1)
        :
        // No hue configured => use original hue
        originalHue;
  }
}
