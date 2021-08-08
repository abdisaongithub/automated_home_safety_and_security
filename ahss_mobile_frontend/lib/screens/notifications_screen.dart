import 'package:ahss_mobile_frontend/components/dashboard_drawer.dart';
import 'package:ahss_mobile_frontend/components/notification_delete_dialog.dart';
import 'package:ahss_mobile_frontend/components/notification_tile.dart';
import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  static String id = 'NotificationsScreen';

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: Text(
          'NOTIFICATIONS',
          style: TextStyle(color: kWhiteColor, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NotificationTile(read: false, title: 'SECURITY STATUS', detail: 'SECURITY STATUS SECURITY ',),
              NotificationTile(read: true, title: 'SECURITY STATUS', detail: 'SECURITY STATUS SECURITY ',),
              NotificationTile(read: true, title: 'SECURITY STATUS', detail: 'SECURITY STATUS SECURITY ',),
              NotificationTile(read: true, title: 'SECURITY STATUS', detail: 'SECURITY STATUS SECURITY ',),
              NotificationTile(read: true, title: 'SECURITY STATUS', detail: 'SECURITY STATUS SECURITY ',),
              NotificationTile(read: true, title: 'SECURITY STATUS', detail: 'SECURITY STATUS SECURITY ',),
              NotificationTile(read: true, title: 'SECURITY STATUS', detail: 'SECURITY STATUS SECURITY ',),
              NotificationDeleteDialog(),
              NotificationDeleteDialog(),
              NotificationDeleteDialog(),
              NotificationDeleteDialog(),
              NotificationDeleteDialog(),
              NotificationDeleteDialog(),

            ],
          ),
        ),
      ),
    );
  }
}
