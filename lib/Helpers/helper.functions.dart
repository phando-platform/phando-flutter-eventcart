import 'package:nb_utils/src/extensions/string_extensions.dart';
import 'package:validators/validators.dart';
import 'package:flutter_share/flutter_share.dart';

bool isEmailValid(String value) {
  if (value.isEmptyOrNull) {
    return false;
  } else {
    String validInput = value.trim();
    if (!isEmail(validInput)) {
      return false;
    }
    return true;
  }
}

bool isPasswordValid(String value) {
  if (value.isEmptyOrNull) {
    return false;
  } else {
    String validInput = value.trim();
    if (validInput.length < 8) {
      return false;
    }
    return true;
  }
}

bool isMobileValid(String value) {
  if (value.isEmptyOrNull) {
    return false;
  } else {
    String validInput = value.trim();
    String pattern = r"^[0-9]{10}$";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(validInput)) {
      return false;
    }
    return true;
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

Future<void> shareProductLink(String title, String videoUrl) async {
  /// todo : implement ios appstore link sharing
  await FlutterShare.share(
    title: title,
    text: videoUrl,
  );
}
