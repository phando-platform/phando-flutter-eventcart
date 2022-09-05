import 'package:event_app/GlobalComponents/colors.dart';
import 'package:event_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validators/validators.dart';
import 'package:flutter_share/flutter_share.dart';

bool isEmailValid(String value) {
  if (value != null && value.isNotEmpty) {
    String validInput = value.trim();
    if (!isEmail(validInput)) {
      return false;
    }
    return true;
  } else {
    return false;
  }
}

bool isPasswordValid(String value) {
  if (value != null && value.isNotEmpty) {
    String validInput = value.trim();
    if (validInput.length < 8) {
      return false;
    }
    return true;
  } else {
    return false;
  }
}

bool isMobileValid(String value) {
  if (value != null && value.isNotEmpty) {
    String validInput = value.trim();
    String pattern = r"^[0-9]{10}$";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(validInput)) {
      return false;
    }
    return true;
  } else {
    return false;
  }
}

getErrorsList(Map<String, dynamic> errorsObj) {
  var errorsAll = [];
  errorsObj.forEach((key, value) {
    var errors = value as List<dynamic>;
    errors.forEach((err) {
      errorsAll.add(err);
    });
  });
  return errorsAll;
}

// toast(String msg) {
//   Fluttertoast.showToast(
//       msg: "This is Center Short Toast",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.black,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

Future<void> shareProductLink(String title, String videoUrl) async {
  /// todo : implement ios appstore link sharing
  await FlutterShare.share(
    title: title,
    text: videoUrl,
  );
}

showAppExitPopup(BuildContext context) {
  return showDialog(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          elevation: 0.5,
          title: const Text('Exit Event Cart?'),
          content: const Text('Sure you want to exit?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor,
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    shadowColor: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(120, 38), //////// HERE
                  ),

                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  //return true when click on "Yes"
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    textStyle: const TextStyle(color: Colors.black),
                    shadowColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(120, 38), //////// HERE
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ) ??
      false; //if showDialouge had returned null, then return false
}
