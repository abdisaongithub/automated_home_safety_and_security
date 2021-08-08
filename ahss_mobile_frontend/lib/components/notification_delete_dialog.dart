import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationDeleteDialog extends StatelessWidget {
  const NotificationDeleteDialog({
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kBlueColor,
                ),
                child: Center(
                  child: Text(
                    'No',
                    style: TextStyle(color: kWhiteColor, fontSize: 18),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Delete ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      'This action can not be undone',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),

              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kRedColor,
                ),
                child: Center(
                  child: Text(
                    'Yes',
                    style: TextStyle(color: kWhiteColor, fontSize: 18),
                  ),
                ),
              ),

              Expanded(child: SizedBox(),),
              SizedBox(width: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
