import 'package:ahss_mobile_frontend/dio_client.dart';
import 'package:ahss_mobile_frontend/models/token_pair.dart';
import 'package:ahss_mobile_frontend/strings.dart';
import 'package:dio/dio.dart';

class LoginInAction {
  static Future<TokenPair> post({String email, String password}) async {
    TokenPair token;
    TokenPair tokenError;
    try {
      Response response = await dioClient.post(
        'auth/login/',
        data: {
          'email': email,
          'password': password,
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        token = TokenPair.fromJson(response.toString());
        return token;
      } else if (response.statusCode == 401) {
        print(401.toString());
      } else {
        tokenError.access = Strings.error;
        print('Not Loaded');
        return token;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
