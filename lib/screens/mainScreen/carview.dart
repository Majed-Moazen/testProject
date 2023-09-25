import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskcar/models/myCars.dart';

import '../../controller/controllerget.dart';

class CarView extends StatelessWidget {
  CarView({required this.index});

  int index = 0;

  @override
  Widget build(BuildContext context) {
    print(index);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: null,
          title: Center(
            child: Text(
              textAlign: TextAlign.center,
              'إضافة مركبة',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            '${(index == 0) ? '${ ControllerGet.myCar[this.index]['type']['name']}' : (index == 1) ? '${ ControllerGet.myCar[this.index]['model']}' : (index == 2) ? '${ ControllerGet.myCar[this.index]['color']}' : (index == 3) ? '${ ControllerGet.myCar[this.index]['board_number']}' : (index == 4) ? MyCar.cars[0].Company_ratio : MyCar.cars[0].Price_kilo}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: "Somar",
                                letterSpacing: 0,
                                color: Color.fromRGBO(235, 100, 64, 1)),
                          ),
                        ),
                        Text(
                          '${(index == 0) ?'نوع المركبة' : (index == 1) ? 'الموديل' : (index == 2) ? 'لون المركبة' : (index == 3) ? 'رقم اللوحة' : (index == 4) ? '' : ''}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              fontFamily: "Somar",
                              letterSpacing: 0,
                              color: Color.fromRGBO(39, 39, 57, 1)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Image.asset(
                          '${(index == 0) ? 'asset/image/steering.png' : (index == 1) ? 'asset/image/carIcon.png' : (index == 2) ? 'asset/image/ColorPalette.png' : (index == 3) ? 'asset/image/PlateNumber.png' : (index == 4) ? 'asset/image/dolar.png' : 'asset/image/100.png'}'),

                      ],
                    ),
                separatorBuilder: (context, index) => Container(
                    margin: EdgeInsetsDirectional.symmetric(vertical: 4),
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey),
                itemCount: 6),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'صورة المركبة',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: "Somar",
                letterSpacing: 0,
                color: Color.fromRGBO(39, 39, 57, 1)),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            '1-صورة الميكانيك\n2-صورة المركبة\n3- صورة اللوحة\n4- الهوية الشخصية\n5-الوكالة أو التفويض',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: "Somar",
                letterSpacing: 0,
                color: Color.fromRGBO(39, 39, 57, 1)),
            textDirection: TextDirection.rtl,
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsetsDirectional.only(top: 3, bottom: 3),
                      height: 130,
                      child: ListView.separated(
                        reverse: true,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 15),
                        itemBuilder: (context, index) => Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                height: 142,
                                width: 152,
                                child: Image.asset(index==0? 'asset/image/imageCar.png':'asset/image/imageCar2.png')),
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          MaterialButton(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        shape: CircleBorder(),
                        title: Container(
                            padding: EdgeInsetsDirectional.only(top: 50),
                            margin:
                                EdgeInsetsDirectional.symmetric(vertical: 30),
                            child: Image.asset('asset/image/amico.png',
                                width: 194, height: 123)),
                        content: Text(
                          'طلبك قيد المراجعة \nسيتم اعلامك بالنتيجة',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: "Somar",
                            color: Color.fromRGBO(39, 39, 57, 1),
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              margin: EdgeInsetsDirectional.only(top: 30),
                              width: 253,
                              height: 53,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 57, 1),
                                  borderRadius: BorderRadius.circular(90)),
                              child: Text(
                                'موافق',
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
                      ));
            },
            child: Container(
              alignment: AlignmentDirectional.center,
              margin: EdgeInsetsDirectional.only(bottom: 5),
              width: 346,
              height: 30,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 39, 57, 1),
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                'إضافة المركبة',
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
        ]),
      ),
    );
  }
}
