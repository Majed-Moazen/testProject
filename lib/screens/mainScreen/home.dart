import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskcar/models/myCars.dart';
import 'package:taskcar/screens/mainScreen/addcar.dart';
import 'package:taskcar/services/settingsservices.dart';
import 'package:taskcar/controller/controllerget.dart';

import 'carview.dart';



class home extends StatelessWidget {
  const home({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: GlobalKey(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: null,
          title: Center(
            child: Text(
              textAlign: TextAlign.center,
              'مركباتي',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  fontFamily: "Inter",
                  letterSpacing: 0,
                  color: Color.fromRGBO(39, 39, 57, 1)),
            ),
          ),
          actions: [
            Container(
                width: 40,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    weight: 10,
                    color: Colors.black,
                  ),
                ),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset.zero, // changes position of shadow
                      ),
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ))),
          ]),
      body:GetBuilder<ControllerGet>(
        init: ControllerGet()..filldata(),
        builder:(controller) {
        return ControllerGet.myCar.length>0? Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ListView.builder(
                  padding: EdgeInsetsDirectional.only(bottom:80 ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.to(   CarView(index:  index));

                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                          start: 40, top: 20, bottom: 20, end: 40),
                      width: 243,
                      height: 193,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                // margin: EdgeInsetsDirectional.symmetric(horizontal: 30),
                                width: 64,
                                height: 64,
                                child: CircleAvatar(
                                  backgroundImage:
                                  AssetImage( '${MyCar.cars[0].pathImage}'),


                                  backgroundColor:  Colors.white,
                                ),
                              ),
                              Text(
                                '  ${ ControllerGet.myCar[index]['model']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    fontFamily: "Somar",
                                    letterSpacing: 0,
                                    color: Color.fromRGBO(235, 100, 64, 1)),
                              ),
                            ],
                          ),
                          Text(
                            'Color : ${ ControllerGet.myCar[index]['color']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                fontFamily: "Somar",
                                letterSpacing: 0,
                                color: Color.fromRGBO(235, 100, 64, 1)),
                          ),
                          Text(
                            'board number : ${ ControllerGet.myCar[index]['board_number']}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                fontFamily: "Somar",
                                letterSpacing: 0,
                                color: Color.fromRGBO(235, 100, 64, 1)),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset.zero, // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 4,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                  itemCount: ControllerGet.myCar.length),
              MaterialButton(
                onPressed: () {
                  Get.to( AddCar());

                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(bottom: 20),
                  width: 346,
                  height: 53,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(39, 39, 57, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'إضافة مركبة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      fontFamily: "Somar",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ):Center(child: CircularProgressIndicator(),);
      },)

    );
  }
}
