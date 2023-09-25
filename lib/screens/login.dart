import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/settingsservices.dart';
import 'addimage.dart';
import 'mainScreen/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscur = true;
  TextEditingController passwordController = TextEditingController(),
      phoneController = TextEditingController();
  GlobalKey<FormState> form = GlobalKey();
  bool wait = false;

  @override
  Widget build(BuildContext context) {
    SettingsServices c = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Image.asset(
                  'asset/image/background.png',
                  fit: BoxFit.fill,
                  height: 460,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Container(
                        width: double.infinity,
                        child: Image.asset("asset/image/khdnelogo.png")),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "تسجيل الدخول",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: "Somar",
                              letterSpacing: 0,
                              color: Color.fromRGBO(39, 39, 57, 1)),
                          // width: 129px
                          // height: 33px
                          // top: 184px
                          // left: 234px
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    myTextField(
                        text: 'رقم الهاتف',
                        tController: phoneController,
                        tInpute: TextInputType.phone,
                        sufixIcon: Icons.call),
                    myTextField(
                        text: 'كلمة السر',
                        tController: passwordController,
                        tInpute: TextInputType.visiblePassword,
                        sufixIcon: Icons.lock,
                        ispas: true),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'هل نسيت كلمة السر؟',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            fontFamily: 'Somar',
                            height: 0.1321,
                            color: Color.fromRGBO(39, 39, 57, 1),
                          ),
                        )),
                    wait
                        ? Center(child: CircularProgressIndicator())
                        : MaterialButton(
                            onPressed: () {
                              if (form.currentState!.validate()) {
                                setState(() {
                                  wait = true;
                                });

                                c.dio.post('api/login', data: {
                                  'phone_number': phoneController.text,
                                  'password': passwordController.text,
                                }).then((value) {
                                  c.sharedPreferences.setString(
                                      'token', value?.data['data']['token']);
                                  Get.offAll(home());
                                  Fluttertoast.showToast(
                                      msg: 'تم تسجيل الدخول بنجاح  ',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  setState(() {
                                    wait = false;
                                  });
                                }).catchError((e) {
                                  Fluttertoast.showToast(
                                      msg: ' : خطأ ${e.message}',
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
                              width: 346,
                              height: 53,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 57, 1),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                'تسجيل الدخول',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to( AddImage());
                          },
                          child: Text(
                            '   إنشاء حساب ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: "Somar",
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: "Somar",
                              letterSpacing: 0,
                              color: Color.fromRGBO(39, 39, 57, 1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myTextField(
      {required String text,
      sufixIcon,
      required TextEditingController tController,
      TextInputType tInpute = TextInputType.text,
      bool ispas = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        textAlign: TextAlign.right,
        keyboardType: tInpute,
        controller: tController,
        validator: (value) {
          if (value!.isEmpty) {
            return ' $text فارغ ';
          }
          return null;
        },
        obscureText: ispas ? obscur : false,
        decoration: InputDecoration(
            prefixIcon: ispas
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscur = !obscur;
                      });
                    },
                    icon: obscur
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : null,
            suffixIcon: Icon(sufixIcon,
                color: Color.fromRGBO(235, 100, 64, 1), size: 20),
            hintText: text,
            hintStyle: TextStyle(
              fontFamily: 'Somar',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 0.2539,
              color: Color.fromRGBO(39, 39, 57, 1),
            )),
      ),
    );
  }
}
