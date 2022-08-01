import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Screens/Authentication/signin.dart';
import '../../Screens/Checkout/cart_screen.dart';
import '../../Screens/Home%20Screen/all_products.dart';
import '../../Screens/Home%20Screen/home_screen.dart';
import '../../Screens/Home%20Screen/wish_list.dart';
import '../../Screens/Profile/profile_screen.dart';
import '../../Services/cart_notifier.dart';
import '../../Models/order_create_model.dart';
import '../../constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String? username;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? token;
  Future<void> getToken() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      username = prefs.getString('username') ?? 'Guest';
      token = prefs.getString('token');
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Consumer(builder: (_, ref, watch) {
        List<Cart> cartItems = ref.watch(cartProvider).cartItems;
        return FloatingActionButton(
          onPressed: () {
            cartItems.isEmpty
                ? EasyLoading.showError('No items in the Cart')
                : const CartScreen().launch(context);
          },
          backgroundColor: kMainColor,
          child: IconBadge(
            icon: const Icon(Icons.shopping_cart),
            itemCount: cartItems.length,
            badgeColor: kMainColor,
            itemColor: Colors.white,
            hideZero: true,
            onTap: () {
              cartItems.isEmpty
                  ? EasyLoading.showError('No items in the Cart')
                  : const CartScreen().launch(context);
            },
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomeScreen(),
          const AllProducts(page: 1),
          const WishList(),
          username == 'Guest' ? const SignIn() : const ProfileScreen()
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        elevation: 6.0,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        activeColor: kMainColor,
        inactiveColor: kGreyTextColor,
        // ignore: prefer_const_literals_to_create_immutables
        icons: [
          Icons.home,
          Icons.shopping_basket,
          Icons.favorite,
          Icons.person
        ],
        activeIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
