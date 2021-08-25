import 'package:ahss_mobile_frontend/dio_client.dart';
import 'package:ahss_mobile_frontend/models/sensors_summary_model.dart';
import 'package:dio/dio.dart';


class GetSensorsSummary {
  static Future<SensorsSummary> getSummary() async {
    SensorsSummary sensorsSummary;
    SensorsSummary sensorsSummaryError;
    try {
      Response response = await dioClient.get('app/sensors',);


      if(response.statusCode == 200){
        sensorsSummary = SensorsSummary.fromMap(response.data);
        return sensorsSummary;
      } else {
        sensorsSummaryError.hum[0].hum = -1;
        return sensorsSummaryError;
      }

    } catch (e){
      print(e.toString());
    }
  }
}
