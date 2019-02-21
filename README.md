# Jdenticon Dart

[![MIT License](https://img.shields.io/github/license/VergillR/jdenticon-dart.svg?style=flat)](https://github.com/VergillR/jdenticon-dart/blob/master/LICENSE)


This is the Dart/Flutter implementation of the [Jdenticon](https://jdenticon.com) project which was created with JavaScript.
Jdenticon is a quick and easy to use library for generating highly recognizable identicons using SVG.

![Sample identicons](https://jdenticon.com/hosted/github-samples.png)

## Getting Started

Jdenticon uses a string as input (for example: a name, label, or customer id) and hashes this string which then is used to generate a "personalized" icon, which is called an identicon. Identicons can be used for many things, but generally are deployed as an enhanced version of an avatar automatically assigned to an account or client. If you want to learn more about Jdenticon, click [here](https://jdenticon.com).

This library can be used in any Dart project, but this guide assumes Flutter is used to create and display the identicons. Jdenticon exposes the function `toSvg` which is the only function needed to generate an identicon. The result of `toSvg` is a raw SVG string. Flutter cannot natively display raw SVG strings as images. Therefore, Jdenticon needs the library [flutter_svg](https://pub.dartlang.org/packages/flutter_svg) to easily integrate the rendering of SVG, so import `flutter_svg` also in your project.

It only takes 2 steps to show the identicon in Flutter:
- Give a string `input` (for example, a name, label or id) to the function `Jdenticon.toSvg(input)` to obtain a raw SVG string:

```dart
// please note that Jdenticon is case-sensitive, so 'jim' gives another identicon than 'Jim' or 'JIM'
String rawSvg = Jdenticon.toSvg('Your input string');
```

- You can now render the identicon wherever you want with `flutter_svg` by calling `SvgPicture.string(rawSvg, fit: BoxFit.fill, height: 128, width: 128,)`. This returns a Widget that renders the identicon wherever it is placed in the Widget tree. Use the settings provided by SvgPicture (fit, height, width, alignment, etc.) to change the sizing and behavior:

```dart
// you can store the SVG as a Widget for later use
Widget identicon = SvgPicture.string(rawSvg, fit: BoxFit.contain, height: 128, width: 128,);
// or simply use it directly like any other Widget
Widget card = Card(
  child: Column(
    children: <Widget>[
      SvgPicture.string(rawSvg, fit: BoxFit.contain, height: 64, width: 64,),
      SizedBox(height: 12.0,),
      SvgPicture.string(rawSvg, fit: BoxFit.scaleDown, height: 128, width: 128,),
      SizedBox(height: 12.0,),
      SvgPicture.string(rawSvg, fit: BoxFit.fitWidth, width: 256,),
    ],
  ),
);
```

## Advanced use

Jdenticon offers customization options to its users to change the appearance of the identicons. You can override any of the configuration settings. See the [icon designer page](https://jdenticon.com/icon-designer.html) for more details.
For example:
```dart
final String rawSvg = Jdenticon.toSvg('Your input string',
            colorSaturation: 0.48,
            grayscaleSaturation: 0.48,
            colorLightnessMinValue: 0.84,
            colorLightnessMaxValue: 0.84,
            grayscaleLightnessMinValue: 0.84,
            grayscaleLightnessMaxValue: 0.84,
            backColor: '#2a4766ff',
            hues: [207]);
```
The code above will make your identicons look like this:
![Custom icons](https://github.com/VergillR/jdenticon-dart/blob/master/example/customization_icons.png)

## Example

Jdenticon comes with a complete `example.dart` file in the example folder. Run this file in Flutter to see Jdenticon in action.
Here is a sample:
![Example](https://github.com/VergillR/jdenticon-dart/blob/master/example/example_screenshot.png)

## License

Jdenticon Dart is available under the [MIT license](https://github.com/vergillR/jdenticon-dart/blob/master/LICENSE).
2019 Vergill Lemmert.
