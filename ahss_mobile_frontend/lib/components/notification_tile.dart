import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';


class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key key,
    this.read,
    this.title,
    this.detail,
  }) : super(key: key);

  final bool read;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: kPrimaryColor,
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
          boxShadow: [
            BoxShadow(
              color: kBlueShadeColor,
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      detail,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              if (read) SvgPicture.asset(
                'assets/images/read.svg',
                height: 30,
                color: kBlueColor,
                allowDrawingOutsideViewBox: false,
              ) else Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: kBlueColor,
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
