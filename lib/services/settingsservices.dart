import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login.dart';
import '../screens/mainScreen/home.dart';
class SettingsServices extends GetxService{
  late SharedPreferences sharedPreferences;
  late Dio dio;
   Widget screen=Login();
  Future<SettingsServices> init() async
  {
    sharedPreferences=await SharedPreferences.getInstance();
   if(sharedPreferences.get('token')!=null)
     {

       screen=home();
     }
dio=await Dio( BaseOptions(
  baseUrl: 'http://taskflutter.futurecode-projects.com/',
));

    return this;
  }

}