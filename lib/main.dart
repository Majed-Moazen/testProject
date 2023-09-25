import 'package:flutter/material.dart';
import 'package:taskcar/screens/login.dart';
import 'package:get/get.dart';
import 'package:taskcar/services/settingsservices.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(const MyApp());
}

Future initServices()async
{
  await Get.putAsync(() =>SettingsServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingsServices c=Get.put(SettingsServices());
    return GetMaterialApp(
      title: 'test Car',
      theme: ThemeData(primarySwatch: Colors.deepOrange,),
      home:c.screen
    );
  }
}