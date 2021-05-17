import 'dart:convert';

import 'package:ahss_mobile_frontend/models/obtain_token_pair.dart';
import 'package:flutter/material.dart';
import 'package:ahss_mobile_frontend/screens/dashboard_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LogInScreen extends StatefulWidget {
  static String id = 'LogInScreen';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController;
    TextEditingController passwordController;

    String email;
    String password;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Log In',
            style: TextStyle(
              fontFamily: 'lucida',
              fontSize: 40.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          LoginInput(
            inputType: TextInputType.emailAddress,
            label: 'Email',
            obscure: false,
            onChanged: (newText){
              email = newText;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          LoginInput(
            inputType: TextInputType.text,
            label: 'Password',
            obscure: true,
            onChanged: (newText){
              password = newText;
            },
            // textEditingControllercontroller: passwordController,
          ),
          SizedBox(
            height: 40.0,
          ),
          MaterialButton(
            onPressed: () async {
              var client = Dio();
              Response response ;
              final storage = FlutterSecureStorage();

              var formData = FormData.fromMap({
                'email': email,
                'password': password,
              });

              print(email);
              print(password);

              try {
                response = await client.post(
                  'http://192.168.43.46:8000/auth/token/obtain/',
                  data: formData,
                  // options: Options(headers: {'Accept': 'application/json'}),
                //  TODO: Find out what happened to this option shit

                );
              } catch (e) {
                print(e.toString());
              }

              if (response.statusCode == 200){
                // email = "";
                // password = "";



                var tokens = obtainTokenPairFromMap(response.data.toString());

                storage.write(key: 'access_token', value: tokens.access);
                storage.write(key: 'refresh_token', value: tokens.refresh);


                Navigator.pushNamed(context, DashboardScreen.id);
              }

            },
            child: Text(
              'Log In',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            height: 40.0,
            minWidth: 200,
            color: Colors.white,
            splashColor: Colors.white30,
            elevation: 6.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginInput extends StatefulWidget {
  // TextEditingController textEditingControllercontroller;
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
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.symmetric(
        horizontal: 50.0,
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
          cursorColor: Colors.black,
          obscureText: widget.obscure,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
          strutStyle: StrutStyle.disabled,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: Colors.black45,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
                style: BorderStyle.solid,
              ),
            ),
            focusColor: Colors.white,
            hasFloatingPlaceholder: true,
          ),
        ),
      ),
    );
  }
}
