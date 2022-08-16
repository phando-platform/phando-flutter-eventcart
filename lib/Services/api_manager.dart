import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
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
import '../Models/profile_model.dart' as PM;
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
  static const apiUrl = "https://events.phando.in/api/v1/";

  Future<LoginModel> signInWithEmail(
      String username, String passwordUser) async {
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

  Future<SignupModel> signUpWithEmail(
      String firstName,
      String lastName,
      String userName,
      String emailAddress,
      String phoneNumber,
      String passwordUser) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'register'),
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

  Future<AddBillingModel> setBillingInfo(String token, String address,
      String mobile, String city, String post, String countryId) async {
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

  Future<AddBillingModel> setShippingInfo(
      String token,
      String name,
      String address,
      String addressTwo,
      String city,
      String post,
      String countryId,
      String mobile) async {
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
        'shipping_mobile': mobile
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

  Future<PM.ProfileModel> getProfileInfo(String token) async {
    final response = await http.get(
      Uri.parse(apiUrl + 'profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PM.ProfileModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return PM.ProfileModel.fromJson(data);
    }
  }

  Future<OrderCreateResponse> createOrder(
      PM.Value userData,
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
    final response = await http.post(
      Uri.parse(apiUrl + 'order'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <dynamic, dynamic>{
        'first_name': userData.customer!.firstName,
        'last_name': userData.customer!.lastName,
        'user_address_1': userData.customer!.address,
        'user_mobile': userData.customer!.mobile,
        'user_email': userData.customer!.email,
        'user_post_code': userData.billing!.postCode,
        'user_city': userData.billing!.userCity,
        'user_country_id': userData.billing!.countryId,
        'shipping_name': userData.shipping!.shippingName,
        'shipping_mobile': userData.shipping!.shippingMobile,
        'shipping_email': userData.shipping!.shippingEmail,
        'shipping_post': userData.shipping!.shippingPost,
        'shipping_town': userData.shipping!.shippingTown,
        'shipping_country_id': userData.shipping!.shippingCountryId,
        'address_line_one': userData.shipping!.addressLineOne,
        'cart': json.encode(model.cart),
        'payment_by': payment,
        'currency': json.encode(model.currency),
        'currency.id': model.currency!.id,
        'currency.exchange_rate': model.currency!.exchangeRate,
        'subTotal': subTotal,
        'totalShipping': totalShipping,
        'total': total,
        'coupon_id': couponId,
        'coupon_discount': couponDiscount,
        'shipping_address_id': shippingId,
        'billing_address_id': billingId,
      },
    );

    print("api manager: create order");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return OrderCreateResponse.fromJson(data);
      // return OrderCreateResponse();
    } else {
      final data = jsonDecode(response.body);
      return OrderCreateResponse.fromJson(data);
      // return OrderCreateResponse();
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
      final data = jsonDecode(response.body);
      return OrderListModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      return OrderListModel.fromJson(data);
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

  Future<SendResetCodeModel> cancelOrder(String token, String orderId,
      String orderDetailsId, String productId, String description) async {
    final response = await http.post(
      Uri.parse(apiUrl + 'cancel_order'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: <String, String>{
        'order_id': orderId,
        'order_details_id': orderDetailsId,
        'product_id': productId,
        'order_stat_desc': description,
        'remarks': ' ',
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return SendResetCodeModel.fromJson(data);
    } else {
      return SendResetCodeModel.fromJson(data);
    }
  }

  Future<SendResetCodeModel> removeWishList(
      String token, String productId) async {
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
}
