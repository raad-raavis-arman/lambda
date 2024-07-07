import 'package:fluttertoast/fluttertoast.dart';

class MToast {
  static void showSuccessToast({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      webBgColor: 'linear-gradient(to right, #2ECC71, #27AE60)',
      timeInSecForIosWeb: 2,
      webPosition: 'center',
    );
  }

  static void showErrorToast({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      webBgColor: 'linear-gradient(to right, #E74C3C, #C0392B)',
      timeInSecForIosWeb: 2,
      toastLength: Toast.LENGTH_LONG,
      webPosition: 'center',
    );
  }
}
