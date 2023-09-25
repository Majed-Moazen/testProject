import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:taskcar/screens/login.dart';
import 'package:taskcar/services/settingsservices.dart';

import 'mainScreen/home.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

bool wait = false;

class _SingUpState extends State<SingUp> {
  bool obscur = true;
  TextEditingController nameController = TextEditingController(),
      passwordController = TextEditingController(),
      password2Controller = TextEditingController(),
      phoneController = TextEditingController();
  GlobalKey<FormState> form = GlobalKey();

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
                          "إنشاء حساب",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: "Somar",
                              letterSpacing: 0,
                              color: Color.fromRGBO(39, 39, 57, 1)),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    myTextField(
                        text: 'الاسم',
                        tController: nameController,
                        tInpute: TextInputType.name,
                        sufixIcon: Icons.person),
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
                    myTextField(
                        text: 'تأكيد كلمة السر',
                        tController: password2Controller,
                        tInpute: TextInputType.visiblePassword,
                        sufixIcon: Icons.lock,
                        onchanged: (String s) {
                          if (s.length >= passwordController.text.length) {
                            if (s != passwordController.text) {
                              Misfit = true;
                              form.currentState!.validate();
                            } else {
                              Misfit = false;
                              form.currentState!.validate();
                            }
                          }
                        },
                        ispas: true),
                    wait
                        ? Center(child: CircularProgressIndicator())
                        : MaterialButton(
                            onPressed: () {
                              if (form.currentState!.validate()) {
                                setState(() {
                                  wait = true;
                                });
                                c.dio.post('api/register', data: {
                                  "fullname": nameController.text,
                                  "phone_number": phoneController.text,
                                  "password": passwordController.text,
                                  "image": '',
                                  "password_confirmation":
                                      password2Controller.text,
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
                                  Get.to(Login());
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
                              width: 346,
                              height: 53,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(39, 39, 57, 1),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                'إنشاء الحساب',
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
                          onPressed: () {},
                          child: Text(
                            '   تسجيل الدخول ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              fontFamily: "Somar",
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        Text(
                          ' لديك حساب؟',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              fontFamily: "Somar",
                              letterSpacing: 0,
                              color: Color.fromRGBO(39, 39, 57, 1)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              maxLines: 2,
                              '  الشروط والأحكام وسياسة الخصوصية ',
                              style: TextStyle(
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontFamily: "Somar",
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          ' متابعتك تعني موافقتك على ',
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

  bool Misfit = false;

  Widget myTextField(
      {required String text,
      onchanged,
      sufixIcon,
      required TextEditingController tController,
      TextInputType tInpute = TextInputType.text,
      bool ispas = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        onChanged: onchanged,
        textAlign: TextAlign.right,
        keyboardType: tInpute,
        controller: tController,
        validator: (value) {
          if (value!.isEmpty) {
            return ' $text فارغ ';
          } else if (Misfit && ispas) return ' غير متطابق ';
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
