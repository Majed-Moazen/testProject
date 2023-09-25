import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskcar/screens/singup.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                child: Image.asset("asset/image/khdnelogo.png"),
              ),
              Text(
                "أضف صورتك الشخصية",
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
              Text(
                "اجعل صورتك واضحة",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    fontFamily: "Somar",
                    letterSpacing: 0,
                    color: Color.fromRGBO(39, 39, 57, 1)),
                // width: 129px
                // height: 33px
                // top: 184px
                // left: 234px
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Stack(

                    children: [
                      Container(
                          width: 241,
                          child: Icon(
                            Icons.person,
                            size: 150,
                            color: Color.fromRGBO(229, 229, 229, 1),
                          ),
                          height: 241,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 9,
                                  blurRadius: 9,
                                  offset: Offset.zero, // changes position of shadow
                                ),
                              ],
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ))),
                      InkWell(
                        onTap: (){},
                        child: Container(
                            width: 50,
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.white,
                            ),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(235, 100,64, 1),

                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ))),
                      ),

                    ],
                    alignment: AlignmentDirectional.bottomEnd,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to( SingUp());

                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: 346,
                  height: 53,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(39, 39, 57, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'التالي',
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
        ),
      ),
    );
  }
}
