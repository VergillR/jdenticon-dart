import 'package:test/test.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';

void main() {
  const word1 = 'Omega';
  const svgCorrespondingToWord1 =
      '<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64" preserveAspectRatio="xMidYMid meet"><path fill="#e5e5e5" d="M29.5 27.5a1,1 0 1,1 2 ,0a1,1 0 1,1 -2,0M32.5 27.5a1,1 0 1,1 2 ,0a1,1 0 1,1 -2,0M32.5 36.5a1,1 0 1,1 2 ,0a1,1 0 1,1 -2,0M29.5 36.5a1,1 0 1,1 2 ,0a1,1 0 1,1 -2,0M26.5 30.5a1,1 0 1,1 2 ,0a1,1 0 1,1 -2,0M35.5 30.5a1,1 0 1,1 2 ,0a1,1 0 1,1 -2,0M35.5 33.5a1,1 0 1,1 2 ,0a1,1 0 1,1 -2,0M26.5 33.5a1,1 0 1,1 2 ,0a1,1 0 1,1 -2,0" /><path fill="#5b570a" d="M26.0 29.0L26.0 29.0L26.0 26.0L29.0 26.0ZM35.0 26.0L35.0 26.0L38.0 26.0L38.0 29.0ZM38.0 35.0L38.0 35.0L38.0 38.0L35.0 38.0ZM29.0 38.0L29.0 38.0L26.0 38.0L26.0 35.0Z" /><path fill="#e8dd30" d="M30.2 32.0a1,1 0 1,1 3 ,0a1,1 0 1,1 -3,0" /></svg>';

  const word2 = 'Testing#!%*&';
  const svgCorrespondingToWord2 =
      '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet"><rect width="16" height="16" fill="#2dc96e" opacity="0.47" /><path fill="#9367b0" d="M5.0 5.0L5.0 5.0L5.0 2.0L6.5 2.0ZM8.0 2.0L8.0 2.0L11.0 2.0L11.0 3.5ZM11.0 11.0L11.0 11.0L11.0 14.0L9.5 14.0ZM8.0 14.0L8.0 14.0L5.0 14.0L5.0 12.5ZM2.0 8.0L2.0 8.0L2.0 5.0L3.5 5.0ZM11.0 5.0L11.0 5.0L14.0 5.0L14.0 6.5ZM14.0 8.0L14.0 8.0L14.0 11.0L12.5 11.0ZM5.0 11.0L5.0 11.0L2.0 11.0L2.0 9.5Z" /><path fill="#3b264a" d="M2.0 2.0L2.0 2.0L5.0 2.0L5.0 5.0ZM14.0 2.0L14.0 2.0L14.0 5.0L11.0 5.0ZM14.0 14.0L14.0 14.0L11.0 14.0L11.0 11.0ZM2.0 14.0L2.0 14.0L2.0 11.0L5.0 11.0Z" /><path fill="#ac75d1" d="M5.0 5.0L5.0 5.0L8.0 5.0L8.0 7.1L6.2 6.2L7.1 8.0L5.0 8.0ZM11.0 5.0L11.0 5.0L11.0 8.0L8.9 8.0L9.8 6.2L8.0 7.1L8.0 5.0ZM11.0 11.0L11.0 11.0L8.0 11.0L8.0 8.9L9.8 9.8L8.9 8.0L11.0 8.0ZM5.0 11.0L5.0 11.0L5.0 8.0L7.1 8.0L6.2 9.8L8.0 8.9L8.0 11.0Z" /></svg>';

  test(
      'Output should match the corresponding svg string of test word1 with default size, colorSaturation 0.8, colorLightnessMinValue 0.2, colorLightnessMaxValue 0.9 and padding 0.4',
      () {
    expect(
        Jdenticon.toSvg(word1,
            colorSaturation: 0.8,
            colorLightnessMinValue: 0.2,
            colorLightnessMaxValue: 0.9,
            padding: 0.4),
        equals(svgCorrespondingToWord1));
  });

  test(
      'Output should match the corresponding svg string of test word2 with grayscaleSaturation 0.32, grayscaleLightnessMinValue 0.2, grayscaleLightnessMaxValue 0.5, backColor #2dc96e78 and hues [ 276 ]',
      () {
    expect(
        Jdenticon.toSvg(word2,
            size: 16,
            grayscaleSaturation: 0.32,
            grayscaleLightnessMinValue: 0.2,
            grayscaleLightnessMaxValue: 0.5,
            backColor: '#2dc96e78',
            hues: [276]),
        equals(svgCorrespondingToWord2));
  });
}
