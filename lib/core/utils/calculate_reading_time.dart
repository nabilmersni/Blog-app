int calculateReadingTime({required String content}) {
  final wordsCount = content.split(RegExp(r'\s+')).length;
  // speed = d/t
  final readingTime = wordsCount / 255;
  return readingTime.ceil();
}
