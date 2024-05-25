extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    if (length == 1) {
      return toUpperCase();
    }
    return this[0].toUpperCase() + substring(1);
  }

  String sentence() => split(' ').map((_) => _.capitalize()).join(' ');

  String get firstLetter {
    return this[0];
  }
}
