import 'package:ahss_mobile_frontend/screens/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SomeElement extends StatelessWidget {
  get email => null;

  get password => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          onChanged: (newText) {
            var email = newText;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        LoginInput(
          inputType: TextInputType.text,
          label: 'Password',
          obscure: true,
          onChanged: (newText) {
            var password = newText;
          },
          // textEditingControllercontroller: passwordController,
        ),
        SizedBox(
          height: 40.0,
        ),
        MaterialButton(
          onPressed: () async {
            var client = Dio();
            Response response;
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

            if (response.statusCode == 200) {
              // email = "";
              // password = "";

              // var tokens =
              // obtainTokenPairFromMap(response.data.toString());

              // storage.write(key: 'access_token', value: tokens.access);
              // storage.write(key: 'refresh_token', value: tokens.refresh);

              // Navigator.pushNamed(context, DashboardScreen.id);
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
    );
  }
}
