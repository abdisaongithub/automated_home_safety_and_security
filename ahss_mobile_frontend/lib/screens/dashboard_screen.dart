import 'package:ahss_mobile_frontend/actions/get_sensors_summary_action.dart';
import 'package:ahss_mobile_frontend/components/dashboard_drawer.dart';
import 'package:ahss_mobile_frontend/components/the_container.dart';
import 'package:ahss_mobile_frontend/models/sensors_summary_model.dart';
import 'package:ahss_mobile_frontend/screens/sensors_detail.dart';
import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:ahss_mobile_frontend/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DashboardScreen extends StatefulWidget {
  static String id = 'DashboardScreen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isLoading = true;
  SensorsSummary _sensorsSummary;

  @override
  void initState() {
    super.initState();
    getSensorsSummary();
  }

  getSensorsSummary() async {
    _sensorsSummary = await GetSensorsSummary.getSummary();

    if (_sensorsSummary.hum.isEmpty) {
      print('Error Happened');
    } else {
      setState(() {
        _isLoading = false;
        print('Successful');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final DashboardArguments args = ModalRoute.of(context).settings.arguments;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double forty = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        title: Image(
          height: 28,
          image: AssetImage(
            'assets/images/logo.png',
          ),
          fit: BoxFit.contain,
        ),
        backgroundColor: kPrimary,
        centerTitle: true,
      ),
      drawer: DashboardDrawer(),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.only(top: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TheContainer(
                          size: forty,
                          backgroundColor: kPrimary,
                          shadeColor: kRedShade,
                          themeColor: kRed,
                          title: 'TEMPERATURE',
                          radius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                          ),
                          middleText: _isLoading == false
                              ? _sensorsSummary.temps[0].temp.toString()
                              : 'NAN',
                          onTap: () {
                            Navigator.pushNamed(context, SensorsDetailScreen.id,
                                arguments: SensorDetailArguments(
                                    name: Strings.Temperature));
                          },
                        ),
                        TheContainer(
                          size: forty,
                          backgroundColor: kPrimary,
                          shadeColor: kBlueShade,
                          themeColor: kBlue,
                          title: 'HUMIDITY',
                          radius: BorderRadius.only(
                            topRight: Radius.circular(15),
                          ),
                          middleText: _isLoading == false
                              ? _sensorsSummary.hum[0].hum.toString()
                              : 'NAN',
                          onTap: () {
                            Navigator.pushNamed(context, SensorsDetailScreen.id,
                                arguments: SensorDetailArguments(
                                    name: Strings.Humidity));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TheContainer(
                          size: forty,
                          backgroundColor: kPrimary,
                          shadeColor: kBlueShade,
                          themeColor: kBlue,
                          title: 'MOTION',
                          middleText:
                              _isLoading == false ? 'None Detected' : 'NAN',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SensorsDetailScreen.id,
                              arguments: SensorDetailArguments(
                                name: Strings.Motion,
                              ),
                            );
                          },
                        ),
                        TheContainer(
                          size: forty,
                          backgroundColor: kPrimary,
                          shadeColor: kBlueShade,
                          themeColor: kBlue,
                          title: 'FIRE',
                          middleText: _isLoading == false ? 'Safe' : 'NAN',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SensorsDetailScreen.id,
                              arguments: SensorDetailArguments(
                                name: Strings.Fire,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TheContainer(
                          size: forty,
                          backgroundColor: kPrimary,
                          shadeColor: kBlueShade,
                          themeColor: kBlue,
                          title: 'CH4 - METHANE',
                          radius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                          ),
                          middleText: _isLoading == false ? 'Low' : 'NAN',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SensorsDetailScreen.id,
                              arguments: SensorDetailArguments(
                                name: Strings.CH4,
                              ),
                            );
                          },
                        ),
                        TheContainer(
                          size: forty,
                          backgroundColor: kPrimary,
                          shadeColor: kBlueShade,
                          themeColor: kBlue,
                          title: 'CO2',
                          radius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                          ),
                          middleText: _isLoading == false ? 'Low' : 'NAN',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SensorsDetailScreen.id,
                              arguments: SensorDetailArguments(
                                name: Strings.CO2,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          _isLoading
              ? Container(
                  height: height,
                  width: width,
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Loading Sensors Summary For You ....',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(
                  height: 0,
                ),
        ],
      ),
    );
  }
}

class DashboardArguments {
  final int studentId;
  final String studentName;

  DashboardArguments({this.studentId, this.studentName});
}

class DashboardButton extends StatelessWidget {
  final Function function;
  final String title;
  final IconData iconData;
  final double height;

  const DashboardButton(
      {Key key, this.function, this.title, this.iconData, this.height = 160})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: this.height,
      minWidth: 160,
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: function,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 35,
          ),
          SizedBox(height: 20.0),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
