

import 'package:fluttertoast/fluttertoast.dart';

import '../utils/constants/constant_page.dart';

void showToast({required String message}){
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: buttoncolor,
    textColor: buttontextcolor,
    fontSize: titleFontSize

  );
}