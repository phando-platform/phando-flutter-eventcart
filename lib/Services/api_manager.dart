import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:event_app/Models/book_order/book_order_body_model.dart';
import 'package:event_app/Models/book_order/book_order_reponse_model.dart';
import 'package:event_app/Models/delivery/delivery_body_model.dart';
import 'package:event_app/Models/delivery/delivery_reponse_model.dart';
import 'package:event_app/Models/tracking_order/tracking_order_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart' hide log;
import '../Models/add_billing_model.dart';
import '../Models/add_to_wishlist_model.dart';
import '../Models/all_products_model.dart';
import '../Models/banners_model.dart';
import '../Models/billing_info_model.dart';
import '../Models/coupon_apply_model.dart';
import '../Models/home_model.dart';
import '../Models/order_create_model.dart';
import '../Models/order_create_response.dart';
import '../Models/order_list_model.dart';
import '../Models/order_timelines_model.dart';
import '../Models/popular_products_model.dart';
import '../Models/product_details_model.dart';
import '../Models/profile_model.dart';
import '../Models/send_reset_code_model.dart';
import '../Models/trends_model.dart';
import '../Models/wish_list_model.dart';
import '../Models/category_model.dart';
import '../Models/change_password_model.dart';
import '../Models/login_model.dart';
import '../Models/profile_update_model.dart';
import '../Models/signup_model.dart';

class ApiManager {
  // static const apiUrl = "https://my-bazar.maantheme.com/api/v1/";
  //static const apiUrl = "https://events.phando.in/api/v1/";
  static const apiUrl = "https://eventcart.co.in/api/v1/";

  Future<LoginModel> signInWithEmail(
    String username,
    String passwordUser,
  ) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'login'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <String, String>{
        'username': username,
        'password': passwordUser,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return LoginModel.fromJson(data);
    } else {
      return LoginModel.fromJson(data);
    }
  }

  Future<bool> sendOtp({
    required String mobileNumber,
  }) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'send-otp'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <String, String>{'mobile': mobileNumber},
    );
    final data = Map<String, dynamic>.from(jsonDecode(response.body));
    log(response.body);
    if (response.statusCode == 200) {
      return data['status'] == 'success';
    } else {
      return false;
    }
  }

  Future<LoginModel> verifyMobileOtp({
    required String mobileNumber,
    required String otp,
  }) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'mobile/otp/verify'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <String, String>{
        'mobile': mobileNumber,
        'otp': otp,
      },
    );
    final data = jsonDecode(response.body);
    log(response.body);
    if (response.statusCode == 200) {
      return LoginModel.fromJson(data);
    } else {
      return LoginModel.fromJson(data);
    }
  }

  Future<SignupModel> signUpWithEmail(
      String firstName,
      String lastName,
      String userName,
      String emailAddress,
      String phoneNumber,
      String passwordUser) async {
    final response = await http.post(
      // Uri.parse(apiUrl + 'register'),
      Uri.parse(apiUrl + 'register_with_email_verification'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <dynamic, dynamic>{
        'first_name': firstName,
        'last_name': lastName,
        'username': userName,
        'email': emailAddress,
        'mobile': phoneNumber,
        'password': passwordUser,
        'password_confirmation': passwordUser,
      },
    );
    final data = jsonDecode(response.body);
    print("response");
    print(data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return SignupModel.fromJson(data);
    } else {
      return SignupModel.fromJson(data);
    }
  }

  Future<SendResetCodeModel> resetPasswordWithEmail(String emailAddress) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'send_reset_code'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <String, String>{
        'email': emailAddress,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return SendResetCodeModel.fromJson(data);
    } else {
      return SendResetCodeModel.fromJson(data);
    }
  }

  Future<SendResetCodeModel> verifyOtp(String emailAddress, String code) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'verify_password_reset_code'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <String, String>{
        'email': emailAddress,
        'code': code,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return SendResetCodeModel.fromJson(data);
    } else {
      return SendResetCodeModel.fromJson(data);
    }
  }

  Future<SendResetCodeModel> setNewPassword(
      String emailAddress, String code, String password) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'user_password_reset'),
      headers: <String, String>{
        'Accept': 'application/json',
      },
      body: <String, String>{
        'email': emailAddress,
        'code': code,
        'password': password,
        'password_confirmation': password,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return SendResetCodeModel.fromJson(data);
    } else {
      return SendResetCodeModel.fromJson(data);
    }
  }

  Future<ChangePasswordModel> changePassword(String currentPassword,
      String newPassword, String confirmPassword, String token) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'change_password'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <String, String>{
        'old_password': currentPassword,
        'password': newPassword,
        'password_confirmation': confirmPassword,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ChangePasswordModel.fromJson(data);
    } else {
      return ChangePasswordModel.fromJson(data);
    }
  }

  Future<BannersModel> bannerList() async {
    final response = await http.get(
      Uri.parse(apiUrl + 'banners'),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return BannersModel.fromJson(data);
    } else {
      return BannersModel.fromJson(data);
    }
  }

  Future<TrendsModel> trendList() async {
    final response = await http.get(
      Uri.parse(apiUrl + 'trends'),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TrendsModel.fromJson(data);
    } else {
      return TrendsModel.fromJson(data);
    }
  }

  Future<PopularProductsModel> popularList() async {
    final response = await http.get(
      Uri.parse(apiUrl + 'popular_products'),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return PopularProductsModel.fromJson(data);
    } else {
      return PopularProductsModel.fromJson(data);
    }
  }

  Future<PopularProductsModel> flashList() async {
    final response = await http.get(
      Uri.parse(apiUrl + 'flash_sale'),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return PopularProductsModel.fromJson(data);
    } else {
      return PopularProductsModel.fromJson(data);
    }
  }

  Future<CategoryModel> categoryList() async {
    final response = await http.get(
      Uri.parse(apiUrl + 'categories'),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CategoryModel.fromJson(data);
    } else {
      return CategoryModel.fromJson(data);
    }
  }

  Future<WishListModel> wishList(String token) async {
    final response = await http.get(
      Uri.parse(apiUrl + 'wishlist'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return WishListModel.fromJson(data);
    } else {
      return WishListModel.fromJson(data);
    }
  }

  Future<TrendsModel> categoryProduct(int id, int page) async {
    print('DONE');
    print(id);
    print(page);
    final response = await http.get(
        Uri.parse(apiUrl + 'category/${id.toString()}/products?page=$page'));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TrendsModel.fromJson(data);
    } else {
      return TrendsModel.fromJson(data);
    }
  }

  Future<TrendsModel> allProduct(int page) async {
    final response = await http.get(Uri.parse(apiUrl + 'products?page=$page'));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TrendsModel.fromJson(data);
    } else {
      return TrendsModel.fromJson(data);
    }
  }

  Future<AddToWishlistModel> addToWishList(String id, String token) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'add_to_wishlist'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <String, String>{
        'product_id': id,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return AddToWishlistModel.fromJson(data);
    } else {
      return AddToWishlistModel.fromJson(data);
    }
  }

  Future<TrendsModel> searchProduct(String query, int page) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'product_search?page=$page'),
      headers: {
        'Accept': 'application/json',
      },
      body: <String, String>{
        'search': query,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return TrendsModel.fromJson(data);
    } else {
      return TrendsModel.fromJson(data);
    }
  }

  Future<AllProductsModel> allProductList() async {
    final response = await http.get(
      Uri.parse(apiUrl + 'products'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AllProductsModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return AllProductsModel.fromJson(data);
    }
  }

  Future<HomeModel> getHome() async {
    final response = await http.get(
      Uri.parse(apiUrl + 'home'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return HomeModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return HomeModel.fromJson(data);
    }
  }

  Future<ProductDetailsModel> productDetails(String id) async {
    final response = await http.get(
      Uri.parse(apiUrl + 'products/$id'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProductDetailsModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return ProductDetailsModel.fromJson(data);
    }
  }

  Future<BillingInfoModel> getBillingInfo(String token) async {
    final response = await http.get(
      Uri.parse(apiUrl + 'profile/billing'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return BillingInfoModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return BillingInfoModel.fromJson(data);
    }
  }

  Future<AddBillingModel> setBillingInfo({
    required String token,
    required String address,
    required String mobile,
    required String city,
    required String post,
    required String countryId,
    required String state,
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'profile/billing'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <dynamic, dynamic>{
        'address_1': address,
        'user_city': city,
        'mobile': mobile,
        'post_code': post,
        'country_id': countryId,
        'state': state,
        'email': email,
      },
    );
    print(" api manager setBillingInfo : ");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AddBillingModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return AddBillingModel.fromJson(data);
    }
  }

  Future<AddBillingModel> setShippingInfo({
    required String token,
    required String name,
    required String address,
    required String addressTwo,
    required String city,
    required String post,
    required String countryId,
    required String mobile,
    required String state,
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'profile/shipping'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <dynamic, dynamic>{
        'shipping_name': name,
        'address_line_one': address,
        'shipping_town': city,
        'address_line_two': addressTwo,
        'shipping_post': post,
        'shipping_country_id': countryId,
        'shipping_mobile': mobile,
        'shipping_state': state,
        'shipping_email': email,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AddBillingModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return AddBillingModel.fromJson(data);
    }
  }

  Future<ProfileModel> getProfileInfo(String token) async {
    final response = await http.get(
      Uri.parse(apiUrl + 'profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print("Profile" + " " + token);
    print("Profile" + " " + response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProfileModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return ProfileModel.fromJson(data);
    }
  }

  Future<OrderCreateResponse> createOrder(
      OrderCreateModel model,
      String token,
      String payment,
      String subTotal,
      String totalShipping,
      String total,
      String couponDiscount,
      String couponId,
      String shippingId,
      String billingId) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    String? billingFirstName = _prefs.getString('firstName') ?? "Not Specified";
    String? billingLastName = _prefs.getString('lastName') ?? "Not Specified";
    String? billingAddOne =
        _prefs.getString('billing_add_one') ?? "Not Specified";
    String? billingPhone = _prefs.getString('billing_phone') ??
        _prefs.getString('phone') ??
        '0000000000';
    String? billingEmail = _prefs.getString('billing_email') ?? "Not Specified";
    String? billingPostCode =
        _prefs.getString('billing_postal_Code') ?? "Not Specified";
    String? billingUserCity =
        _prefs.getString('billing_user_city') ?? "Not Specified";
    String? billingUserState =
        _prefs.getString('billing_user_state') ?? "Not Specified";
    String? shippingFirstName =
        _prefs.getString('shipping_full_name') ?? "Not Specified";
    String? shippingLastName =
        _prefs.getString('shipping_full_name') ?? "Not Specified";
    String? shippingAddOne =
        _prefs.getString('shipping_add_one') ?? "Not Specified";
    String? shippingPhone = _prefs.getString('shipping_phone') ??
        _prefs.getString('phone') ??
        '0000000000';
    String? shippingEmail =
        _prefs.getString('shipping_email') ?? "Not Specified";
    String? shippingPostCode =
        _prefs.getString('shipping_postal_Code') ?? "Not Specified";
    String? shippingUserCity =
        _prefs.getString('shipping_user_city') ?? "Not Specified";
    String? shippingUserState =
        _prefs.getString('shipping_user_state') ?? "Not Specified";

    final response = await http.post(
      Uri.parse(apiUrl + 'order'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: CreateOrderBody(
        first_name: billingFirstName,
        last_name: billingLastName,
        user_address_1: billingAddOne,
        user_mobile: billingPhone,
        user_email: billingEmail,
        user_post_code: billingPostCode,
        user_city: billingUserCity,
        user_country_id: "104",
        shipping_name: shippingFirstName,
        shipping_mobile: shippingPhone,
        shipping_email: shippingEmail,
        shipping_post: shippingPostCode,
        shipping_town: shippingUserCity,
        shipping_state: shippingUserState,
        address_line_one: shippingAddOne,
        shipping_country_id: "104",
        payment_by: payment,
        subTotal: subTotal,
        totalShipping: totalShipping,
        total: total,
        currency: model.currency ??
            Currency(
              id: '7',
              exchangeRate: '1',
            ),
        cart: model.cart ?? [],
      ).toJson(),
    );

    log(
      CreateOrderBody(
        first_name: billingFirstName,
        last_name: billingLastName,
        user_address_1: billingAddOne,
        user_mobile: billingPhone,
        user_email: billingEmail,
        user_post_code: billingPostCode,
        user_city: billingUserCity,
        user_country_id: "104",
        shipping_name: shippingFirstName,
        shipping_mobile: shippingPhone,
        shipping_email: shippingEmail,
        shipping_post: shippingPostCode,
        shipping_town: shippingUserCity,
        shipping_state: shippingUserState,
        address_line_one: shippingAddOne,
        shipping_country_id: "104",
        payment_by: payment,
        subTotal: subTotal,
        totalShipping: totalShipping,
        total: total,
        currency: model.currency ??
            Currency(
              id: '7',
              exchangeRate: '1',
            ),
        cart: model.cart ?? [],
      ).toJson(),
    );

    log("api manager: create order");
    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return OrderCreateResponse.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return OrderCreateResponse.fromJson(data);
    }
  }

  Future<OrderListModel> orderList(String token, int perPage) async {
    final response = await http.get(
      Uri.parse(apiUrl + 'orders?page=$perPage'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      // final data = jsonDecode(response.body);
      try {
        log(
          OrderListModel.fromJson(response.body).value?.data?[0].toJson() ?? "",
        );
        return OrderListModel.fromJson(response.body);
      } catch (error, stackTrace) {
        log(error.toString());
        log(stackTrace.toString());
        rethrow;
      }
    } else {
      final data = Map<String, dynamic>.from(jsonDecode(response.body));
      return OrderListModel.fromJson(response.body);
    }
  }

  Future<CouponApplyModel> addCoupon(String coupon, String token) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'verify_coupon'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <String, String>{
        'code': coupon,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CouponApplyModel.fromJson(data);
    } else {
      return CouponApplyModel.fromJson(data);
    }
  }

  Future<ProfileUpdateModel> updateProfile(String token, String firstName,
      String lastName, String mobile, String email) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'profile/update'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <String, String>{
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'mobile': mobile,
        'dob': '2011-11-11',
        'gender': '1'
      },
    );
    final data = jsonDecode(response.body);
    log(response.body);
    if (response.statusCode == 200) {
      return ProfileUpdateModel.fromJson(data);
    } else {
      return ProfileUpdateModel.fromJson(data);
    }
  }

  Future<OrderTimelinesModel> getDeliveryStatus(int id, String token) async {
    final response = await http.get(
      Uri.parse(apiUrl + 'order_timelines/$id'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return OrderTimelinesModel.fromJson(data);
    } else {
      return OrderTimelinesModel.fromJson(data);
    }
  }

  Future<SendResetCodeModel?> cancelOrder({
    required String orderDetailsId,
    required String description,
    required String reason,
    required String token,
    required String productId,
    required String orderId,
  }) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'cancel_order'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <String, String>{
        'order_details_id': orderDetailsId,
        'order_stat_desc': description,
        'order_id': orderId,
        'product_id': productId,
        'reason': reason,
      },
    );
    final data = Map<String, dynamic>.from(jsonDecode(response.body));
    log(data.toString());
    if (response.statusCode == 200) {
      return SendResetCodeModel.fromJson(data);
    } else {
      return SendResetCodeModel.fromJson(data);
    }
  }

  Future<SendResetCodeModel> removeWishList(
    String token,
    String productId,
  ) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'remove_from_wishlist'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <String, String>{
        'id': productId,
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return SendResetCodeModel.fromJson(data);
    } else {
      return SendResetCodeModel.fromJson(data);
    }
  }

  Future<DeliveryResponseModel?> getDeliveryDetails({
    required DeliveryBodyModel details,
  }) async {
    final response = await http.post(
      Uri.parse('http://tca.paapos.in/api/Operations/getRateCard'),
      headers: {
        'Accept': '*/*',
        'Authkey': 'mohitarfkjf8g2weqkaozy',
        // 'Content-Type': 'application/json',
      },
      body: details.toMap(),
    );
    log('BODY: ' + details.toMap().toString());
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    log('RESPONSE: ' + data.toString());
    if (response.statusCode == 200) {
      if (data.containsKey('ReplyMsg') && data['ReplyMsg'] == 'Data Found') {
        final dataList = data['Providers'] as List<Map<String, dynamic>>;
        List<DeliveryResponseModel> deliveryData =
            dataList.map((e) => DeliveryResponseModel.fromMap(e)).toList();
        return deliveryData.first;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<TrackingOrderResponseModel?> getTrackingDetails({
    required String menifestId,
    required String token,
  }) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'track_order'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'manifest_id': menifestId,
      },
    );
    log('BODY: ' + menifestId);
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    log('RESPONSE: ' + data.toString());
    if (response.statusCode == 200) {
      if (data.containsKey('success') && data['success'] == true) {
        final dataList = Map<String, dynamic>.from(data['value']);
        TrackingOrderResponseModel deliveryData =
            TrackingOrderResponseModel.fromMap(dataList);
        return deliveryData;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String> cancelOrderMain({
    required String menifestId,
    required String awbNo,
    required String reason,
  }) async {
    final response = await http.post(
      Uri.parse('http://tca.paapos.in/api/Order/CancelOrder'),
      headers: {
        'Accept': '*/*',
        'Authkey': 'mohitarfkjf8g2weqkaozy',
        // 'Content-Type': 'application/json',
      },
      body: {
        'ManifestID': menifestId,
        "AWBno": awbNo,
        "Reason": reason,
      },
    );
    log(
      'BODY: ' +
          {
            'ManifestID': menifestId,
            "AWBno": awbNo,
            "Reason": reason,
          }.toString(),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    log('RESPONSE: ' + data.toString());
    if (response.statusCode == 200) {
      return data['ReplyMsg'];
    } else {
      return 'Unable to reach server.\nPlease check your internet connection & try again.';
    }
  }
}
