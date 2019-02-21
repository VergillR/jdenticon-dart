import 'package:test/test.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';

void main() {
  const word1 = 'Omega';
  const svgCorrespondingToWord1 =
      '<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64" preserveAspectRatio="xMidYMid meet"><path fill="#e5e5e5" d="M21 12a4,4 0 1,1 8 ,0a4,4 0 1,1 -8,0M34 12a4,4 0 1,1 8 ,0a4,4 0 1,1 -8,0M34 51a4,4 0 1,1 8 ,0a4,4 0 1,1 -8,0M21 51a4,4 0 1,1 8 ,0a4,4 0 1,1 -8,0M8 25a4,4 0 1,1 8 ,0a4,4 0 1,1 -8,0M47 25a4,4 0 1,1 8 ,0a4,4 0 1,1 -8,0M47 38a4,4 0 1,1 8 ,0a4,4 0 1,1 -8,0M8 38a4,4 0 1,1 8 ,0a4,4 0 1,1 -8,0" /><path fill="#999332" d="M6 19L6 19L6 6L19 6ZM45 6L45 6L58 6L58 19ZM58 45L58 45L58 58L45 58ZM19 58L19 58L6 58L6 45Z" /><path fill="#ccc666" d="M24 32a7,7 0 1,1 15 ,0a7,7 0 1,1 -15,0" /></svg>';
  const word2 = 'Year of the Rabbit';
  const svgCorrespondingToWord2 =
      '<svg xmlns="http://www.w3.org/2000/svg" width="240" height="240" viewBox="0 0 240 240" preserveAspectRatio="xMidYMid meet"><path fill="#997832" d="M120 96L120 96L120 108L108 108ZM132 108L132 108L120 108L120 96ZM120 144L120 144L120 132L132 132ZM108 132L108 132L120 132L120 144ZM108 108L108 108L108 120L96 120ZM144 120L144 120L132 120L132 108ZM132 132L132 132L132 120L144 120ZM96 120L96 120L108 120L108 132Z" /><path fill="#ccab66" d="M102 96L102 96L108 102L102 108L96 102ZM144 102L144 102L138 108L132 102L138 96ZM138 144L138 144L132 138L138 132L144 138ZM96 138L96 138L102 132L108 138L102 144ZM108 108L108 108L120 108L120 120L108 120ZM112 119L112 119L119 119L119 112L112 112ZM132 108L132 108L132 120L120 120L120 108ZM121 112L121 112L121 119L128 119L128 112ZM132 132L132 132L120 132L120 120L132 120ZM128 121L128 121L121 121L121 128L128 128ZM108 132L108 132L108 120L120 120L120 132ZM119 128L119 128L119 121L112 121L112 128Z" /></svg>';
  const word3 = 'Testing#!%*&';
  const svgCorrespondingToWord3 =
      '<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" preserveAspectRatio="xMidYMid meet"><path fill="#e8e8e8" d="M5 5L5 5L5 -6L10 -6ZM16 -6L16 -6L27 -6L27 -1ZM27 27L27 27L27 38L21 38ZM16 38L16 38L5 38L5 32ZM-6 16L-6 16L-6 5L-1 5ZM27 5L27 5L38 5L38 10ZM38 16L38 16L38 27L32 27ZM5 27L5 27L-6 27L-6 21Z" /><path fill="#545454" d="M-6 -6L-6 -6L5 -6L5 5ZM38 -6L38 -6L38 5L27 5ZM38 38L38 38L27 38L27 27ZM-6 38L-6 38L-6 27L5 27Z" /><path fill="#d19375" d="M5 5L5 5L16 5L16 12L9 9L12 16L5 16ZM27 5L27 5L27 16L19 16L22 9L16 12L16 5ZM27 27L27 27L16 27L16 19L22 22L19 16L27 16ZM5 27L5 27L5 16L12 16L9 22L16 19L16 27Z" /></svg>';
  const word4 = 'Jdenticon';
  const svgCorrespondingToWord4 =
      '<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64" preserveAspectRatio="xMidYMid meet"><rect width="64" height="64" fill="#2dc96e" opacity="0.47058823529411764" /><path fill="#a45fd2" d="M25 6L25 6L32 12L25 19L19 12ZM45 12L45 12L38 19L32 12L38 6ZM38 58L38 58L32 51L38 45L45 51ZM19 51L19 51L25 45L32 51L25 58ZM12 19L12 19L19 25L12 32L6 25ZM58 25L58 25L51 32L45 25L51 19ZM51 45L51 45L45 38L51 32L58 38ZM6 38L6 38L12 32L19 38L12 45ZM19 19L19 19L32 19L32 32L19 32ZM22 27L22 27L27 32L32 27L27 22ZM45 19L45 19L45 32L32 32L32 19ZM36 22L36 22L32 27L36 32L41 27ZM45 45L45 45L32 45L32 32L45 32ZM41 36L41 36L36 32L32 36L36 41ZM19 45L19 45L19 32L32 32L32 45ZM27 41L27 41L32 36L27 32L22 36Z" /><path fill="#9367b0" d="M6 6L6 6L19 6L19 12ZM58 6L58 6L58 19L51 19ZM58 58L58 58L45 58L45 51ZM6 58L6 58L6 45L12 45Z" /></svg>';

  test(
      'Output should match the corresponding svg string of test word1 with default size and default padding',
      () {
    expect(Jdenticon.toSvg(word1), equals(svgCorrespondingToWord1));
  });
  test(
      'Output should match the corresponding svg string of test word2 with size 240 and padding 0.4',
      () {
    expect(Jdenticon.toSvg(word2, size: 240, padding: 0.4),
        equals(svgCorrespondingToWord2));
  });
  test(
      'Output should match the corresponding svg string of test word3 with negative size 32 and padding -0.2',
      () {
    expect(Jdenticon.toSvg(word3, size: -32, padding: -0.2),
        equals(svgCorrespondingToWord3));
  });

  test(
      'Output should match the corresponding svg string of test word4 with colorSaturation 0.56, grayscaleSaturation 0.32, colorLightnessMinValue 0.31, colorLightnessMaxValue 0.80, grayscaleLightnessMinValue: 0.2, grayscaleLightnessMaxValue: 0.5, backColor #2dc96e78 and hues [ 276 ]',
      () {
    expect(
        Jdenticon.toSvg(word4,
            colorSaturation: 0.56,
            grayscaleSaturation: 0.32,
            colorLightnessMinValue: 0.31,
            colorLightnessMaxValue: 0.80,
            grayscaleLightnessMinValue: 0.2,
            grayscaleLightnessMaxValue: 0.5,
            backColor: '#2dc96e78',
            hues: [276]),
        equals(svgCorrespondingToWord4));
  });
}
