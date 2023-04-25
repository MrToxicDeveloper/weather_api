import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../screens/home_screen/model/home_model.dart';
// import 'package:news_app/screens/home/model/news_model.dart';

class ApiHelper {
  Future<MainModel> apiCaller(String City) async {
    Uri uri = Uri.parse(
        "https://api.weatherapi.com/v1/current.json?key=6e46df35e2804af1a9775258230904&q=$City&aqi=no");
    var response = await http.get(uri);
    var json = jsonDecode(response.body);

    MainModel mainModel = MainModel.fromJson(json);

    return mainModel;
  }
}
