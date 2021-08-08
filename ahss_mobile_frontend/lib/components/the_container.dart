import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../static_files.dart';

class TheContainer extends StatelessWidget {
  const TheContainer({
    Key key,
    @required this.size,
    this.radius,
    this.themeColor,
    this.shadeColor,
    this.backgroundColor,
    this.title,
    this.middleText = 'NAN',
    this.onTap,
  }) : super(key: key);

  final double size;
  final BorderRadiusGeometry radius;
  final Color backgroundColor;
  final Color themeColor;
  final Color shadeColor;
  final String title;
  final String middleText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            top: BorderSide(
              color: themeColor,
              width: 2,
            ),
            left: BorderSide(
              color: themeColor,
              width: 2,
            ),
            right: BorderSide(
              color: themeColor,
              width: 2,
            ),
            bottom: BorderSide(
              color: themeColor,
              width: 2,
            ),
          ),
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              color: shadeColor,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: TextStyle(color: kWhiteColor, fontSize: 18),
            ),
            Expanded(
              child: Center(
                child: Text(middleText, style: TextStyle(color: Colors.white, fontSize: 30,), textAlign: TextAlign.center,) ?? SizedBox(height: 0,),
                ),
              ),
            // TODO: replace Expanded with a configured text
            Padding(
              padding: EdgeInsets.only(right: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
