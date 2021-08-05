import 'package:ahss_mobile_frontend/screens/live_stream_screen.dart';
import 'package:ahss_mobile_frontend/screens/login_screen.dart';
import 'package:ahss_mobile_frontend/screens/dashboard_screen.dart';
import 'package:ahss_mobile_frontend/screens/notifications_screen.dart';
import 'package:ahss_mobile_frontend/screens/sensors_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Automated Home Safety and Security',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LogInScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        SensorsDetailScreen.id: (context) => SensorsDetailScreen(),
        NotificationsScreen.id: (context) => NotificationsScreen(),
        LiveStreamScreen.id: (context) => LiveStreamScreen(),
      },
    );
  }
}
