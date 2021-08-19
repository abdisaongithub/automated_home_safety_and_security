import 'dart:math';

import 'package:ahss_mobile_frontend/screens/dashboard_screen.dart';
import 'package:ahss_mobile_frontend/screens/live_stream_screen.dart';
import 'package:ahss_mobile_frontend/screens/login_screen.dart';
import 'package:ahss_mobile_frontend/screens/notifications_screen.dart';
import 'package:ahss_mobile_frontend/screens/sensor_details/temperature_sensors_detail.dart';
import 'package:ahss_mobile_frontend/screens/settings_screen.dart';
import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6.0,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: kPrimaryColor),
        child: SafeArea(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 20,
              ),
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 35,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: kSecondaryColor,
                endIndent: 14,
                indent: 14,
                thickness: 2,
              ),
              DrawerItem(
                label: 'Settings',
                route: SettingsScreen.id,
              ),
              DrawerItem(
                label: 'LiveStream',
                route: LiveStreamScreen.id,
              ),
              DrawerItem(
                label: 'Notification',
                route: NotificationsScreen.id,
                badge: true,
                num: Random(0).nextInt(7),
              ),
              DrawerItem(
                label: 'Sensors Detail',
                route: SensorsDetailScreen.id,
              ),
              Expanded(
                child: SizedBox(),
              ),
              Divider(
                color: kSecondaryColor,
                endIndent: 14,
                indent: 14,
                thickness: 1,
              ),
              DrawerItem(
                label: 'Logout',
                route: '/',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem({
    @required this.route,
    this.label = 'Default',
    this.badge = false,
    this.num = 0,
  });

  final String route;
  final String label;
  final bool badge;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, route);
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: kCharcoalColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      border: Border(
                        top: BorderSide(
                          color: kBlueColor,
                          width: 2,
                        ),
                        left: BorderSide(
                          color: kBlueColor,
                          width: 2,
                        ),
                        right: BorderSide(
                          color: kBlueColor,
                          width: 2,
                        ),
                        bottom: BorderSide(
                          color: kBlueColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        badge ?
        Positioned(
          top: 14,
          right: 14,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: kBlueColor,
                  blurRadius: 3,
                  offset: Offset(0, 0),
                  spreadRadius: 3,
                ),
              ],
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                num.toString(),
                style: TextStyle(color: kWhiteColor, fontSize: 14),
              ),
            ),
          ),
        ) : SizedBox(),
      ],
    );
  }
}
