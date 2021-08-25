import 'package:ahss_mobile_frontend/dio_client.dart';
import 'package:ahss_mobile_frontend/models/setting_model.dart';
import 'package:ahss_mobile_frontend/models/settings_model.dart';
import 'package:ahss_mobile_frontend/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingsActions {

  static getSettings() async {
    SettingsModel settings;
    Response response = await dioClient.get('/app/settings/');

    if (response.statusCode == 200) {
      settings = SettingsModel.fromJson(response.toString());

      return settings;
    } else {
      settings.next = Strings.NoData;

      return settings;
    }
  }

  static setASetting({
    int settingId,
    String name,
    bool state,
  }) async {
    FlutterSecureStorage storage = new FlutterSecureStorage();

    String token = await storage.read(key: Strings.access);

    SettingModel setting;

    dioClient.options.headers["Authorization"] = "Bearer $token";

    Response response = await dioClient.put(
      '/app/settings/$settingId/',
      data: {
        'id' : settingId,
        'name' : name,
        'state' : state,
      },
    );

    if (response.statusCode == 200) {

      setting = SettingModel.fromJson(response.toString());

      return setting;
    } else {
      setting.state = null;

      print(response.toString());

      return setting;
    }
  }

}
