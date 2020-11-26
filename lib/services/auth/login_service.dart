import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final String url = "http://206.189.56.223/api/";
  final String loginEndPoint = "login";
  static bool status;

  Future<String> login(String phoneNumber, String password) async {
    Response response;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo;
    AndroidDeviceInfo androidInfo;
    if (Platform.isIOS)
      iosInfo = await deviceInfo.iosInfo;
    else
      androidInfo = await deviceInfo.androidInfo;

    try {
      response = await Dio().post("$url$loginEndPoint", data: {
        "phone_number": "$phoneNumber",
        "password": "$password",
        "device_token": "${Platform.isIOS ? iosInfo.identifierForVendor : androidInfo.androidId}"
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', response.data['data']['access_token']);
      final token = prefs.getString("access_token")??"";
      status=response.data['success'];
      return response.data['message'];

    } on DioError catch (e) {
      print("error in login => ${e.response.data}");
      status=e.response.data['success'];
      return '${e.response.data['message']}';
    }
  }
}
