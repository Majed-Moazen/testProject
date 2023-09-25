import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../services/settingsservices.dart';
import '../login.dart';

class AddCar extends StatefulWidget {
  AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  GlobalKey<FormState> form = GlobalKey();
bool wait=false;
  @override
  Widget build(BuildContext context) {
    SettingsServices c=Get.find();
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
                  onTap: (){
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
      body: Form(
        key:  form
      ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            myTextField(
                tController: typeControll,
                sufixIcon: 'asset/image/steering.png',
                text: 'نوع المركبة',
                tInpute: TextInputType.name,
                prefix: Icon(Icons.keyboard_arrow_down_rounded)),
            myTextField(
              tController: modelControll,
              sufixIcon: 'asset/image/carIcon.png',
              text: 'الموديل',
              tInpute: TextInputType.name,
            ),
            myTextField(
                tController: colorControll,
                sufixIcon: 'asset/image/ColorPalette.png',
                text: 'لون المركبة',
                tInpute: TextInputType.name,
                prefix: Icon(Icons.keyboard_arrow_down_rounded)),
            myTextField(
              tController: numberControll,
              sufixIcon: 'asset/image/PlateNumber.png',
              text: 'رقم المركبة',
              tInpute: TextInputType.name,
            ),
            SizedBox(
              height: 18,
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
              height: 7,
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
mainAxisAlignment:  MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsetsDirectional.only(top: 3,bottom: 3),
                        height: 142,
                        child: ListView.separated(
                          reverse: true,

                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          itemBuilder: (context, index) =>
                            index==0?Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                height: 142,
                                width: 152,
                                child: Image.asset('asset/image/Rectangle.png'),
                              ),
                              InkWell(
                                child: Container(
                                  margin: EdgeInsetsDirectional.only(bottom:20),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(235, 100, 64, 1)),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 65.0),
                                child: Text(
                                  'إضافة صورة',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      fontFamily: "Somar",
                                      letterSpacing: 0,
                                      color: Color.fromRGBO(116, 116, 116, 1)),
                                ),
                              ),
                            ],
                          ):Container(clipBehavior: Clip.antiAliasWithSaveLayer,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),height: 142,width: 152,child: Image.asset('asset/image/imageCar.png')),
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
              onPressed: ()  {
                showDialog(context: context, builder: (context) => AlertDialog(


                  shape: CircleBorder(),
                  title: Container(padding: EdgeInsetsDirectional.only(top: 50), margin: EdgeInsetsDirectional.symmetric(vertical: 30),child: Image.asset('asset/image/amico.png',width: 194,height: 123)),
                  content: Text(

                    'طلبك قيد المراجعة \nسيتم اعلامك بالنتيجة',  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: "Somar",
                    color: Color.fromRGBO(39, 39, 57, 1),
                  ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  actions: [          MaterialButton(
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

                if (form.currentState!.validate()) {
                  setState(() {
                    wait = true;
                  });
                  c.dio.post('api/register', data: {
                    "model": typeControll.text,
                    "board_number": numberControll.text,
                    "color": colorControll.text,
                    "model": modelControll.text,

                  }).then((value) {
                    setState(() {
                      wait = false;
                      Fluttertoast.showToast(
                          msg: value?.data['message'],
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  }).catchError((e) {
                    Fluttertoast.showToast(
                        msg: e,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    setState(() {
                      wait = false;
                    });
                  });
                }
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
      ),
    );
  }

  TextEditingController typeControll = TextEditingController(),
      modelControll = TextEditingController(),
      colorControll = TextEditingController(),
      numberControll = TextEditingController();

  Widget myTextField(
      {required String text,
      onchanged,
      sufixIcon,
      prefix,
      required TextEditingController tController,
      TextInputType tInpute = TextInputType.text,
      bool ispas = false}) {
    return TextFormField(
      onChanged: onchanged,
      textAlign: TextAlign.right,
      keyboardType: tInpute,
      textDirection: TextDirection.rtl,
      controller: tController,
      validator: (value) {
        if (value!.isEmpty) {
          return ' $text فارغ ';
        }

        return null;
      },
      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
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
                Image.asset(sufixIcon),
              ],
            ),
          ),
          prefixIcon: prefix,
          hintStyle: TextStyle(
            fontFamily: 'Somar',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            height: 0.2539,
            color: Color.fromRGBO(39, 39, 57, 1),
          )),
    );
  }
}
