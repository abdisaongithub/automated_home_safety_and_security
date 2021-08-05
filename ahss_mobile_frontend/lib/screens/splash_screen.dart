import 'package:ahss_mobile_frontend/screens/dashboard_screen.dart';
import 'package:ahss_mobile_frontend/screens/login_screen.dart';
import 'package:ahss_mobile_frontend/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';

  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = new FlutterSecureStorage();
  var accessToken;

  @override
  void initState() {
    super.initState();
    redirectIfAuthenticated();
  }

  redirectIfAuthenticated() async {

    accessToken = await storage.read(key: Strings.access);

    Future.delayed(Duration(milliseconds: 500), () {
      if (accessToken != null) {
        Navigator.pushReplacementNamed(context, DashboardScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, LogInScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash ...',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
