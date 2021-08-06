import 'package:ahss_mobile_frontend/components/sensor_container.dart';
import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:flutter/material.dart';

class SensorsDetailScreen extends StatefulWidget {
  static String id = 'SensorsDetailScreen';

  @override
  _SensorsDetailScreenState createState() => _SensorsDetailScreenState();
}

class _SensorsDetailScreenState extends State<SensorsDetailScreen> {
  @override
  Widget build(BuildContext context) {

    final forty = MediaQuery.of(context).size.width * 0.4;

    var arguments = ModalRoute.of(context).settings.arguments as SensorDetailArguments;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        title: Text(
          arguments.name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: kPrimary,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SensorContainer(
                    size: forty,
                    backgroundColor: kPrimary,
                    title: 'Living Room',
                    themeColor: kBlue,
                    shadeColor: kBlueShade,
                    radius: BorderRadius.only(topLeft: Radius.circular(15)),
                    middleElement: MiddleElement(value: '27', unit: '°C',),
                    image: 'assets/images/switch_on.svg',
                  ),
                  SensorContainer(
                    size: forty,
                    backgroundColor: kPrimary,
                    title: 'LIVING ROOM',
                    themeColor: kBlue,
                    shadeColor: kBlueShade,
                    radius: BorderRadius.only(topRight: Radius.circular(15)),
                    middleElement: MiddleElement(value: '25.9', unit: '°C',),
                    image: 'assets/images/switch_on.svg',
                  ),
                ],
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SensorContainer(
                    size: forty,
                    backgroundColor: kPrimary,
                    title: 'LIVING ROOM',
                    themeColor: kRed,
                    shadeColor: kRedShade,
                    radius: BorderRadius.only(topRight: Radius.circular(0)),
                    middleElement: MiddleElement(value: '25.9', unit: '°C',),
                    image: 'assets/images/switch_off.svg',
                  ),
                  SensorContainer(
                    size: forty,
                    backgroundColor: kPrimary,
                    title: 'LIVING ROOM',
                    themeColor: kBlue,
                    shadeColor: kBlueShade,
                    radius: BorderRadius.only(topLeft: Radius.circular(0)),
                    middleElement: MiddleElement(value: '27', unit: '°C',),
                    image: 'assets/images/switch_on.svg',
                  ),
                ],
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SensorContainer(
                    size: forty,
                    backgroundColor: kPrimary,
                    title: 'LIVING ROOM',
                    themeColor: kBlue,
                    shadeColor: kBlueShade,
                    radius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                    middleElement: MiddleElement(value: '27', unit: '°C',),
                    image: 'assets/images/switch_on.svg',
                  ),
                  SensorContainer(
                    size: forty,
                    backgroundColor: kPrimary,
                    title: 'LIVING ROOM',
                    themeColor: kRed,
                    shadeColor: kRedShade,
                    radius: BorderRadius.only(bottomRight: Radius.circular(15)),
                    middleElement: MiddleElement(value: '25.9', unit: '°C',),
                    image: 'assets/images/switch_off.svg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiddleElement extends StatelessWidget {
  const MiddleElement({
    Key key,
    this.value,
    this.unit
  }) : super(key: key);
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          value,
          style: TextStyle(
            color: kBlue,
            fontSize: 44,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          unit,
          style: TextStyle(
            color: kBlue,
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}

class SensorDetailArguments{
  final String name;

  SensorDetailArguments({this.name});

}