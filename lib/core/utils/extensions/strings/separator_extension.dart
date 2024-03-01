enum TextType { integer, double, text }

extension SparatorExtension on String {
  String separate({
    int count = 3,
    String separator = ',',
    bool fromRightToLeft = true,
    TextType textType = TextType.text,
  }) {
    if (isEmpty) {
      return '';
    }

    if (count < 1) {
      return this;
    }

    if (count >= length) {
      return this;
    }

    var str = replaceAll(separator, '');
    var endPart = '';

    if (textType == TextType.double) {
      final splited = str.split('.');
      str = splited.first;
      endPart = '.${splited.last}';
    }

    if (fromRightToLeft) {
      str = String.fromCharCodes(str.runes.toList().reversed);
    }

    final chars = str.runes.toList();
    final namOfSeparation =
        (chars.length.toDouble() / count.toDouble()).ceil() - 1;
    final separatedChars =
        List<String>.filled(chars.length + namOfSeparation, '');
    var j = 0;
    for (var i = 0; i < chars.length; i++) {
      separatedChars[j] = String.fromCharCode(chars[i]);
      if (i > 0 && (i + 1) < chars.length && (i + 1) % count == 0) {
        j += 1;
        separatedChars[j] = separator;
      }

      j += 1;
    }

    final formatted = fromRightToLeft
        ? String.fromCharCodes(separatedChars.join().runes.toList().reversed)
        : separatedChars.join();
    return formatted + endPart;
  }
}
