import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

import '../../constant.dart';
import '../Home Screen/home.dart';
import './on_board.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3));
    final SharedPreferences prefs = await _prefs;
    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;

    finish(context);
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

    if (isConnected && prefs.getBool('autoLogin') == true) {
      const Home().launch(context, isNewTask: true);
    } else {
      const OnBoard().launch(context, isNewTask: true);
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            const Image(
              image: AssetImage('images/round_logo.png'),
            ),
            const Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Version 1.0.0',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
