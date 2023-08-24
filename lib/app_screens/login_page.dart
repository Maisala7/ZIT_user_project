import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/app_screens/Register_page.dart';
import 'package:flutter_application_7/app_screens/store_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class login_page extends StatefulWidget {
  final int language;

  login_page(this.language, {super.key});
  @override
  State<StatefulWidget> createState() {
    return login_pageState(language);
  }
}

class login_pageState extends State<login_page> {
  final int language;
  final _log_informkey = GlobalKey<FormState>();
  final loginpasswordController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;
  DatabaseHelper databaseHelper = DatabaseHelper();

  login_pageState(this.language);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [iconcolor, Color.fromARGB(255, 153, 160, 239)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                  alignment:
                      language == 1 ? Alignment.topLeft : Alignment.topRight,
                  child: Text(
                    language == 1 ? "Login" : "تسجيل الدخول",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Form(
                          key: _log_informkey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: nameController,
                                textDirection: language == 1
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "UserName"
                                      : " اسم المستخدم",
                                  hintStyle: const TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),
                                  hintTextDirection: language == 1
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: iconcolor)),
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
                                  } else if (value != nameController.text &&
                                      nameController != usernameController) {
                                    return language == 1
                                        ? 'user name is not correct'
                                        : " اسم المستخدم غير صحيح";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                obscureText: passToggle,
                                textDirection: language == 1
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                                controller: loginpasswordController,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "Password"
                                      : "  كلمة السر",
                                  hintStyle: const TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: iconcolor)),
                                  hintTextDirection: language == 1
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                                  fillColor: Colors.white,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passToggle = !passToggle;
                                      });
                                    },
                                    child: Icon(
                                      passToggle
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: iconcolor,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return language == 1
                                        ? 'This field is required'
                                        : "هذا الحقل مطلوب";
                                  } else if (value !=
                                          loginpasswordController.text &&
                                      loginpasswordController !=
                                          passwordController) {
                                    return language == 1
                                        ? ' password is not correct'
                                        : " كلمة السر  غير صحيحه";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return registerPage(language);
                              }));
                            },
                            child: Text(
                              language == 1 ? " Creat Acount" : "  انشاء حساب",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 78, 68, 68),
                                  fontSize: 20),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            DatabaseHelper databaseHelper = DatabaseHelper();
                            if (_log_informkey.currentState!.validate()) {
                              if (databaseHelper.success == null)
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: iconcolor,
                                        ),
                                      );
                                    });

                              await databaseHelper.loginData(
                                  username: nameController.text,
                                  password: loginpasswordController.text);

                              if (databaseHelper.success) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Storepage(language);
                                }));
                              } else {
                                print('incorrect email or password');
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: iconcolor),
                            child: Center(
                              child: Text(
                                language == 1 ? "Login" : "دخول",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
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
