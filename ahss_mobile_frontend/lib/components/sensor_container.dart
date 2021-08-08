import 'dart:math';

import 'package:flutter/material.dart';
import '../static_files.dart';

class SensorContainer extends StatefulWidget {
  const SensorContainer(
      {Key key,
      @required this.size,
      this.radius,
      this.themeColor,
      this.shadeColor,
      this.backgroundColor,
      this.title,
      this.middleElement,
      this.image})
      : super(key: key);

  final double size;
  final BorderRadiusGeometry radius;
  final Color backgroundColor;
  final Color themeColor;
  final Color shadeColor;
  final String title;
  final String image;
  final Widget middleElement;

  @override
  _SensorContainerState createState() => _SensorContainerState();
}

class _SensorContainerState extends State<SensorContainer>
    with SingleTickerProviderStateMixin {

  var switched_on = Random(0).nextInt(1) == 1 ? true : false ;

  AnimationController _animationController;
  Animation _animation;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeOut);

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size / 2,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border(
          top: BorderSide(
            color: switched_on ? kBlueColor : kRedColor,
            width: 2,
          ),
          left: BorderSide(
            color: switched_on ? kBlueColor : kRedColor,
            width: 2,
          ),
          right: BorderSide(
            color: switched_on ? kBlueColor : kRedColor,
            width: 2,
          ),
          bottom: BorderSide(
            color: switched_on ? kBlueColor : kRedColor,
            width: 2,
          ),
        ),
        borderRadius: widget.radius,
        boxShadow: [
          BoxShadow(
            color: switched_on ? kBlueShadeColor : kRedShadeColor,
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
            widget.title,
            style: TextStyle(color: kWhiteColor, fontSize: 18),
          ),
          Expanded(
            child: Center(
              child: widget.middleElement ?? SizedBox(),
            ),
          ),
          // TODO: replace Expanded with a configured text
          Padding(
            padding: EdgeInsets.only(right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (_animationController.status ==
                        AnimationStatus.completed) {
                      switched_on = !switched_on;
                      _animationController.reverse();
                    } else if (_animationController.status ==
                        AnimationStatus.dismissed) {
                      switched_on = !switched_on;
                      _animationController.forward();
                    }
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: 26,
                        width: 50,
                        decoration: BoxDecoration(
                            color: switched_on ? kBlueColor : kRedColor,
                            borderRadius: BorderRadius.circular(15),),
                      ),
                      Positioned(
                        left: 24 * _animationController.value,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
