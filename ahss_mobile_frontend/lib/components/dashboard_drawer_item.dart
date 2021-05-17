import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({@required this.onPressed, this.title, this.icon, this.num});

  final Function onPressed;
  final String title;
  final IconData icon;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 30.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              Expanded(child: SizedBox()),
              num == null
                  ? SizedBox()
                  : CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text(
                        '$num',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
