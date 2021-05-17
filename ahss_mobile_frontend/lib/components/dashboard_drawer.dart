import 'dart:math';

import 'package:flutter/material.dart';

import 'dashboard_drawer_item.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    Key key,
  }) : super(key: key);

  int randomInteger(){
    return Random().nextInt(7);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1.0,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            floating: true,
            pinned: false,
            expandedHeight: 200.0,
            title: null,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: null,
              background: Image(
                image: AssetImage('assets/images/pp.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildListDelegate(
                [
                  DrawerItem(
                    icon: Icons.image_outlined,
                    title: 'Images',
                    num: randomInteger(),
                    onPressed: ()  {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, GradeReportScreen.id);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.video_collection_outlined,
                    title: 'Videos',
                    num: randomInteger(),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, AttendanceScreen.id);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.list_outlined,
                    title: 'Notifications',
                    num: randomInteger(),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, AcademicCalenderScreen.id);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, MessagesScreen.id);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.history_outlined,
                    title: 'Logs',
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, NotificationsScreen.id);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.help_outline,
                    title: 'Help',
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, NotificationsScreen.id);
                    },
                  ),
                  DrawerItem(
                    icon: Icons.question_answer_outlined,
                    title: 'About',
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, AboutScreen.id);
                    },
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}