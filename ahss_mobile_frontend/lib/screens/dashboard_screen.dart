import 'package:ahss_mobile_frontend/components/dashboard_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class DashboardScreen extends StatefulWidget {
  static String id = 'DashboardScreen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // final DashboardArguments args = ModalRoute.of(context).settings.arguments;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text 1',
        ),
      ),
      drawer: DashboardDrawer(),
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    go();
  }

  void go() async {
    final storage = FlutterSecureStorage();
    // print('Access Token');
    // await print(storage.read(key: 'access_token').then((value) { print(value.characters); }));

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

  const DashboardButton({Key key, this.function, this.title, this.iconData, this.height = 160})
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