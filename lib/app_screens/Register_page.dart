// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/app_screens/login_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';
import 'package:flutter_application_7/mywidget/genderWidget.dart';

class registerPage extends StatefulWidget {
    final int language;

  registerPage(this.language, {super.key});
  @override
  State<StatefulWidget> createState() {
    return registerPageState(language);
  }
}

class registerPageState extends State<registerPage> {
  final int language;
 final RegisterformKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final phoneController = TextEditingController();
    final EmailController = TextEditingController();
    final passwordController = TextEditingController();
    final confrimpasswordController = TextEditingController();
    bool passToggle=true;
  DatabaseHelper databaseHelper = DatabaseHelper();

  registerPageState(this.language);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
    
        body:
       Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [iconcolor, Color.fromARGB(255, 153, 160, 239)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: language == 1
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Text(
                        language == 1 ? "Register" : "إنشاء حساب",
                        style: const TextStyle(color: Colors.white,
                         fontSize: 40,
                         fontWeight: FontWeight.bold,
                         
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Form(
                          key: RegisterformKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                textDirection: language==1?TextDirection.ltr:TextDirection.rtl,
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "UserName"
                                      : " اسم المستخدم",
                                  hintStyle: const TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: iconcolor)),
                                  hintTextDirection: language == 1
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  fillColor: Colors.white,
                                  suffixIcon: const Icon(
                                    Icons.person,
                                    color: iconcolor,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return language == 1
                                        ? 'This field is required'
                                        : "هذا الحقل مطلوب";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: phoneController,
                                textDirection: language==1?TextDirection.ltr:TextDirection.rtl,

                                decoration: InputDecoration(
                                  hintText:
                                      language == 1 ? "Phone" : "رقم الهاتف  ",
                                  hintStyle: const TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: iconcolor)),
                                  hintTextDirection: language == 1
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  fillColor: Colors.white,
                                  suffixIcon: const Icon(
                                    Icons.phone,
                                    color: iconcolor,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return language == 1
                                        ? 'This field is required'
                                        : "هذا الحقل مطلوب";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: EmailController,
                                textDirection: language==1?TextDirection.ltr:TextDirection.rtl,

                                decoration: InputDecoration(
                                  hintText:
                                      language == 1 ? "Email" : " الايميل ",
                                  hintStyle: const TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: iconcolor)),
                                  hintTextDirection: language == 1
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  fillColor: Colors.white,
                                  suffixIcon: const Icon(
                                    Icons.email,
                                    color: iconcolor,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return language == 1
                                        ? 'This field is required'
                                        : "هذا الحقل مطلوب";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: passwordController,
                                textDirection: language==1?TextDirection.ltr:TextDirection.rtl,

                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText:
                                      language == 1 ? "Password" : "كلمة السر",
                                  hintStyle: const TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: iconcolor)),
                                  hintTextDirection: language == 1
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  fillColor: Colors.white,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                         passToggle=!passToggle;
                                      });
                                    },
                                    child:  Icon(
                                      passToggle?
                              Icons.visibility_off:Icons.visibility,
                                      color: iconcolor,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty&&value.length<7) {
                                    return language == 1
                                        ? 'password must consist 7 letters and number'
                                        : " يجب ان تتكون كلمة السر من 7 حروف وارقام ";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: confrimpasswordController,
                                textDirection: language==1?TextDirection.ltr:TextDirection.rtl,

                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "Confirm Password"
                                      : "  تاكيد كلمة السر ",
                                  hintStyle: const TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: iconcolor)),
                                  hintTextDirection: language == 1
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  fillColor: Colors.white,
                                  suffixIcon: InkWell(
                                    onTap:(){ setState(() {
                                              passToggle=!passToggle;
                                     } );},
                                    child:  Icon(
                                     passToggle?
                              Icons.visibility_off:Icons.visibility,
                                      color: iconcolor,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty&& value!=passwordController) {
                                    return language == 1
                                        ? 'password not correct'
                                        : "  كلمة السر غير صحيحه";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        gender(language),
                         const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return login_page(language);
                              }));
                            },
                            child: Text(
                              language == 1
                                  ? " Already have acount?log_in"
                                  : "لديك حساب؟تسجيل الدخول",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 78, 68, 68),
                                  fontSize: 20),
                            )),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () async {
                             showDialog(context: context, 
                            builder: (context){
                              return const Center(
                              child: CircularProgressIndicator(
                                color: iconcolor,
                              ),
                            );}

                              );  
                            DatabaseHelper databaseHelper = DatabaseHelper();
                             if (RegisterformKey.currentState!.validate()){
                            await databaseHelper.registerData(
                                username: usernameController.text,
                                password: passwordController.text,
                                email: EmailController.text,
                                phoneNumber: phoneController.text,
                                gender: 'Male');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return login_page(language);
                            }));
                           } },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: iconcolor),
                            child: Center(
                              child: Text(
                                language == 1 ? "Register" : "تسجيل",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
