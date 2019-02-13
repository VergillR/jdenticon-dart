import 'package:test/test.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';

void main() {
  const word1 = 'Omega';
  const svgCorrespondingToWord1 = '<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64" preserveAspectRatio="xMidYMid meet"><path fill="#e5e5e5" d="M18 8a5,5 0 1,1 10 ,0a5,5 0 1,1 -10,0M34 8a5,5 0 1,1 10 ,0a5,5 0 1,1 -10,0M34 56a5,5 0 1,1 10 ,0a5,5 0 1,1 -10,0M18 56a5,5 0 1,1 10 ,0a5,5 0 1,1 -10,0M2 24a5,5 0 1,1 10 ,0a5,5 0 1,1 -10,0M50 24a5,5 0 1,1 10 ,0a5,5 0 1,1 -10,0M50 40a5,5 0 1,1 10 ,0a5,5 0 1,1 -10,0M2 40a5,5 0 1,1 10 ,0a5,5 0 1,1 -10,0" /><path fill="#999433" d="M0 16L0 16L0 0L16 0ZM48 0L48 0L64 0L64 16ZM64 48L64 48L64 64L48 64ZM16 64L16 64L0 64L0 48Z" /><path fill="#ccc766" d="M22 32a9,9 0 1,1 19 ,0a9,9 0 1,1 -19,0" /></svg>';
  const word2 = 'Year of the Rabbit';
  const svgCorrespondingToWord2 = '<svg xmlns="http://www.w3.org/2000/svg" width="800" height="800" viewBox="0 0 800 800" preserveAspectRatio="xMidYMid meet"><path fill="#997933" d="M400 1120L400 1120L400 760L760 760ZM40 760L40 760L400 760L400 1120ZM400 -320L400 -320L400 40L40 40ZM760 40L760 40L400 40L400 -320ZM760 760L760 760L760 400L1120 400ZM-320 400L-320 400L40 400L40 760ZM40 40L40 40L40 400L-320 400ZM1120 400L1120 400L760 400L760 40Z" /><path fill="#ccac66" d="M940 1120L940 1120L760 940L940 760L1120 940ZM-320 940L-320 940L-140 760L40 940L-140 1120ZM-140 -320L-140 -320L40 -140L-140 40L-320 -140ZM1120 -140L1120 -140L940 40L760 -140L940 -320ZM760 760L760 760L400 760L400 400L760 400ZM761 450L761 450L450 450L450 761L761 761ZM40 760L40 760L40 400L400 400L400 760ZM349 761L349 761L349 450L39 450L39 761ZM40 40L40 40L400 40L400 400L40 400ZM39 349L39 349L349 349L349 39L39 39ZM760 40L760 40L760 400L400 400L400 40ZM450 39L450 39L450 349L761 349L761 39Z" /></svg>';
  const word3 = 'Testing#!%*&';
  const svgCorrespondingToWord3 = '<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" preserveAspectRatio="xMidYMid meet"><path fill="#e5e5e5" d="M5 5L5 5L5 -6L10 -6ZM16 -6L16 -6L27 -6L27 -1ZM27 27L27 27L27 38L21 38ZM16 38L16 38L5 38L5 32ZM-6 16L-6 16L-6 5L-1 5ZM27 5L27 5L38 5L38 10ZM38 16L38 16L38 27L32 27ZM5 27L5 27L-6 27L-6 21Z" /><path fill="#4c4c4c" d="M-6 -6L-6 -6L5 -6L5 5ZM38 -6L38 -6L38 5L27 5ZM38 38L38 38L27 38L27 27ZM-6 38L-6 38L-6 27L5 27Z" /><path fill="#cc8766" d="M5 5L5 5L16 5L16 12L9 9L12 16L5 16ZM27 5L27 5L27 16L19 16L22 9L16 12L16 5ZM27 27L27 27L16 27L16 19L22 22L19 16L27 16ZM5 27L5 27L5 16L12 16L9 22L16 19L16 27Z" /></svg>';

  test('Output should match the corresponding svg string of test word1 with default size and default padding', () {
    expect(Jdenticon.toSvg(word1), equals(svgCorrespondingToWord1));
  });
  test('Output should match the corresponding svg string of test word2 with size 800 and padding 1.4', () {
    expect(Jdenticon.toSvg(word2, 800, 1.4), equals(svgCorrespondingToWord2));
  });
  test('Output should match the corresponding svg string of test word3 with negative size 32 and padding -0.2', () {
    expect(Jdenticon.toSvg(word3, -32, -0.2), equals(svgCorrespondingToWord3));
  });
}