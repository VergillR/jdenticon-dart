class Config {
  final double colorSaturation;
  final double grayscaleSaturation;
  Function colorLightness;
  Function grayscaleLightness;
  final String backColor;
  List<int> hues;

  Config(this.colorSaturation, this.grayscaleSaturation, this.colorLightness,
      this.grayscaleLightness, this.backColor, this.hues);

  double hueFunction(double originalHue) {
    List<int> hueConfig = this.hues;
    int hue;
    // Check if 'hues' is an array-like object. This way we also ensure that
    // the array is not empty, which would mean no hue restriction.
    if (hueConfig != null && hueConfig.isNotEmpty) {
      // originalHue is in the range [0, 1]
      // Multiply with 0.999 to change the range to [0, 1) and then truncate the index.
      hue = hueConfig[(0.999 * originalHue * hueConfig.length).floor()];
    }

    return hue is int
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
