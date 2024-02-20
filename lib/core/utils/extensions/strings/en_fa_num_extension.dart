extension EnFaNumExtension on String {
  String replaceFaNumToEn() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String value = this;
    for (int i = 0; i < farsi.length; i++) {
      value = value.replaceAll(farsi[i], english[i]);
    }
    return value;
  }

  String replaceEnNumToFa() {
    if (isEmpty) return this;
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String value = this;
    for (int i = 0; i < english.length; i++) {
      value = value.replaceAll(english[i], farsi[i]);
    }
    return value;
  }
}
