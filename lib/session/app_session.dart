import 'package:get_storage/get_storage.dart';

// ignore: avoid_classes_with_only_static_members
class AppSession {
  static final datacount = GetStorage();

  // static String get getRouteType => datacount.read('routeType');
  // static String get getInappRouteName => datacount.read('inApprouteName');
  // static int get getInappHomeRouteIndex =>
  //     datacount.read('inAppHomerouteIndex');
  // static String get getLink => datacount.read('link');
  // static String get getToken => datacount.read('token');
  // static String get getUser => datacount.read('user');
  // static Map<String, dynamic> getNotificationData() =>
  //     datacount.read('notificationData');
  // static Map<String, dynamic> getinAppRouteMapData() =>
  //     datacount.read('inAppRouteMapData');
  // static String get getinAppRouteSingleData => datacount.read('inAppRouteData');
  // static String get profileName => datacount.read('profileName');
  // static String get profileImage => datacount.read('profileImage');
  // static List getRecentProductVisit() => datacount.read('recentProductVisit');
  // static bool get isGuest => datacount.read('guest');

  // static Future<void> setGuest(bool data) => datacount.write('guest', data);
  // static Future<void> setProfileName(String data) =>
  //     datacount.write('profileName', data);
  // static Future<void> setProfileImage(String data) =>
  //     datacount.write('profileImage', data);
  // // static Future<void> storeToken(String data) => datacount.write('token', data);
  // static Future<void> storeUser(String data) => datacount.write('user', data);
  // static Future<void> storeRouteType(String data) =>
  //     datacount.write('routeType', data);
  // static Future<void> storeRouteLink(String data) =>
  //     datacount.write('link', data);
  // static Future<void> storeinAppRouteName(String data) =>
  //     datacount.write('inApprouteName', data);
  // static Future<void> storeinAppHomeRouteIndex(int data) =>
  //     datacount.write('inAppHomerouteIndex', data);
  // static Future<void> storeinAppRouteSingleData(String data) =>
  //     datacount.write('inAppRouteData', data);
  // static Future<void> storeinAppRouteMapData(Map<String, dynamic> data) =>
  //     datacount.write('inAppRouteMapData', data);
  // // static Future<void> storeRouteData(Map data) => datacount.write('routeData', data);
  // static Future<void> storeNotificationData(Map<String, dynamic> data) =>
  //     datacount.write('notificationData', data);
  // static Future<void> setRecentProductVisit(List data) =>
  //     datacount.write('recentProductVisit', data);

  static storeUserProfile({
    required String token,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String country,
    required String username,
    required bool autoLogin,
  }) {
    datacount.write('token', token);
    datacount.write('firstName', firstName);
    datacount.write('lastName', lastName);
    datacount.write('email', email);
    datacount.write('phone', phone);
    datacount.write('country', country);
    datacount.write('username', username);
    datacount.write('autoLogin', autoLogin);
  }

  static String get getToken => datacount.read('token') ?? '';
  static String get getUserFirstName => datacount.read('firstName');
  static String get getUserLastName => datacount.read('lastName');
  static String get getUserEmail => datacount.read('email');
  static String get getUserPhone => datacount.read('phone');
  static String get getUsername => datacount.read('username');
  static bool get autoLogin => datacount.read('autoLogin');
  static bool get getUserCountry => datacount.read('country');

  getUserProfile() {
    Map profile = {
      'token': datacount.read('token'),
      'firstName': datacount.read('firstName'),
      'lastName': datacount.read('lastName'),
      'email': datacount.read('email'),
      'phone': datacount.read('phone'),
      'username': datacount.read('username'),
      'country': datacount.read('country')
    };
    return profile;
  }

  static deleteUserProfile() {
    // datacount.remove("route");
    datacount.remove('firstName');
    datacount.remove('lastName');
    datacount.remove('email');
    datacount.remove('phone');
    datacount.remove('country');
    datacount.remove('username');
    datacount.remove('autoLogin');
    datacount.remove('token');
  }

  static deleteToken() {
    datacount.remove('token');
  }
}
