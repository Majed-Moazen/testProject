import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:taskcar/services/settingsservices.dart';

class ControllerGet extends GetxController {

  SettingsServices c=Get.find();
  static List<dynamic> myCar=[];

  void filldata(){

      c.dio.get('api/Vehicle',options:Options(headers:
      {'Authorization' : 'Bearer ${c.sharedPreferences.get('token')}'})).then((value) {
        print(value?.data);
        myCar=value.data['data'];
        print(myCar);
        update();
      });
    }



}
