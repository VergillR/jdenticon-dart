class Config {
  final num saturation;
  Function colorLightness;
  Function grayscaleLightness;
  final String backColor;

  Config(this.saturation, this.colorLightness, this.grayscaleLightness,
      this.backColor);
}
