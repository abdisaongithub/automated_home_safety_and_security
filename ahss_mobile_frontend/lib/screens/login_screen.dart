import 'package:ahss_mobile_frontend/actions/login_action.dart';
import 'package:ahss_mobile_frontend/dio_client.dart';
import 'package:ahss_mobile_frontend/models/token_pair.dart';
import 'package:ahss_mobile_frontend/screens/dashboard_screen.dart';
import 'package:ahss_mobile_frontend/static_files.dart';
import 'package:ahss_mobile_frontend/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogInScreen extends StatefulWidget {
  static String id = 'LogInScreen';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TokenPair _tokenPair;

  String email = '';
  String password = '';
  bool _isLoading = false;
  bool _isLoaded;

  final storage = new FlutterSecureStorage();



  @override
  void initState() {
    super.initState();
    // login();
  }

  login() async {
    _tokenPair = await LoginInAction.post(email: email, password: password);

    if (_tokenPair.access == Strings.error) {

      setState(() {
        _isLoading = false;
      });

      print(Strings.error);

    } else {

      await storage.write(key: Strings.email, value: email);
      await storage.write(key: Strings.password, value: password);
      await storage.write(key: Strings.refresh, value: _tokenPair.refresh);
      await storage.write(key: Strings.access, value: _tokenPair.access);

      Navigator.pushReplacementNamed(context, DashboardScreen.id);

    }
  }

  @override
  Widget build(BuildContext context) {
    double eighty = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      backgroundColor: kPrimary,
      body: !_isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 70,
                      child: Image(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: eighty,
                      height: eighty,
                      decoration: BoxDecoration(
                        color: kSecondary,
                        border: Border(
                          top: BorderSide(
                            color: kBlue,
                            width: 2,
                          ),
                          left: BorderSide(
                            color: kBlue,
                            width: 2,
                          ),
                          right: BorderSide(
                            color: kBlue,
                            width: 2,
                          ),
                          bottom: BorderSide(
                            color: kBlue,
                            width: 2,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: kBlueShade,
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(),
                              flex: 2,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(color: kWhite, fontSize: 18),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            LoginInput(
                              onChanged: (val) {
                                email = val;
                              },
                              inputType: TextInputType.emailAddress,
                              obscure: false,
                              label: "Enter Email Here ... ",
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(color: kWhite, fontSize: 18),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            LoginInput(
                              onChanged: (val) {
                                password = val;
                              },
                              inputType: TextInputType.visiblePassword,
                              obscure: true,
                              label: "Enter Password Here ... ",
                            ),
                            Expanded(
                              child: SizedBox(),
                              flex: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: kBlue,
                                    fontSize: 18,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    login();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: kBlue,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kBlue,
                                          spreadRadius: 2,
                                          blurRadius: 4,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(color: kWhite),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SizedBox(),
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
              ],
            )
          : Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 30,),
              Text('Logging You In', style: TextStyle(color: Colors.white, fontSize: 32),),
              Text('Please Wait...', style: TextStyle(color: Colors.white, fontSize: 28),),
            ],
          )),
    );
  }
}

class LoginInput extends StatefulWidget {
  final TextInputType inputType;
  final String label;
  final bool obscure;
  final Function onChanged;

  LoginInput({
    this.obscure,
    this.label,
    this.inputType,
    this.onChanged,
  });

  @override
  _LoginInputsState createState() => _LoginInputsState();
}

class _LoginInputsState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: kBlue,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: TextField(
          onChanged: widget.onChanged,
          keyboardType: widget.inputType,
          textAlign: TextAlign.left,
          cursorColor: kBlack,
          obscureText: widget.obscure,
          style: TextStyle(
            color: kBlack,
            fontSize: 18.0,
          ),
          strutStyle: StrutStyle.disabled,
          decoration: InputDecoration(
            hintText: widget.label,
            hintStyle: TextStyle(
              color: Colors.black45,
            ),
            focusColor: kBlack,
          ),
        ),
      ),
    );
  }
}
