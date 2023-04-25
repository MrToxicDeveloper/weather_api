import 'package:flutter/material.dart';

import '../../../utils/api_helper/api_helper.dart';
import '../model/home_model.dart';

class HomeProvider extends ChangeNotifier{
  MainModel? mainModel;
  ApiHelper apiHelper = ApiHelper();

  Future<MainModel?> apiCaller(String City) async {
    mainModel = await apiHelper.apiCaller(City);
    // print("${mainModel!.location.name}===========================");
    // return mainModel;
    notifyListeners();
  }
}