import 'package:ahss_mobile_frontend/components/sensor_container.dart';
import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:bezier_chart/bezier_chart.dart';
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
    final ninety = MediaQuery.of(context).size.width * 0.9;

    var arguments =
        ModalRoute.of(context).settings.arguments as SensorDetailArguments;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: Text(
          arguments.name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SensorContainer(
                    size: ninety,
                    backgroundColor: kPrimaryColor,
                    title: 'Living Room',
                    themeColor: kBlueColor,
                    shadeColor: kBlueShadeColor,
                    value: '27',
                    unit: '°C',
                    image: 'assets/images/switch_on.svg',
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  color: Colors.red,
                  height: MediaQuery.of(context).size.width * 0.55,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: BezierChart(
                    bezierChartScale: BezierChartScale.CUSTOM,
                    xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
                    series: const [
                      BezierLine(
                        data: const [
                          DataPoint<double>(value: 10, xAxis: 0),
                          DataPoint<double>(value: 130, xAxis: 5),
                          DataPoint<double>(value: 50, xAxis: 10),
                          DataPoint<double>(value: 150, xAxis: 15),
                          DataPoint<double>(value: 75, xAxis: 20),
                          DataPoint<double>(value: 0, xAxis: 25),
                          DataPoint<double>(value: 5, xAxis: 30),
                          DataPoint<double>(value: 45, xAxis: 35),
                        ],
                      ),
                    ],
                    config: BezierChartConfig(
                      verticalIndicatorStrokeWidth: 3.0,
                      verticalIndicatorColor: Colors.black26,
                      showVerticalIndicator: true,
                      backgroundColor: kPrimaryColor,
                      snap: false,
                    ),
                  ),
                ),
              ],),
              SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SensorDetailArguments {
  final String name;

  SensorDetailArguments({this.name});
}
