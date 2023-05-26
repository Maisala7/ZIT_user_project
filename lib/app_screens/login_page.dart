import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/app_screens/Register_page.dart';
import 'package:flutter_application_7/app_screens/store_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class loginPage extends StatelessWidget {
  final int language;

  loginPage(this.language, {super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _log_informkey = GlobalKey<FormState>();

    final nameController = TextEditingController();
    final loginpasswordController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

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
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
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
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "username"
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
                                  } else if (value != usernameController.text) {
                                    return language == 1
                                        ? 'user name is not correct'
                                        : " اسم المستخدم غير صحيح";
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: loginpasswordController,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "password"
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
                                  suffixIcon: const Icon(
                                    Icons.password,
                                    color: iconcolor,
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return language == 1
                                        ? 'This field is required'
                                        : "هذا الحقل مطلوب";
                                  } else if (value != passwordController.text) {
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
                            await databaseHelper.loginData(
                                username: nameController.text,
                                password: loginpasswordController.text);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Storepage(language);
                            }));
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
