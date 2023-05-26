import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/app_screens/login_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class registerPage extends StatelessWidget {
  final int language;

  registerPage(this.language, {super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterformKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final phoneController = TextEditingController();
    final EmailController = TextEditingController();
    final passwordController = TextEditingController();
    final confrimpasswordController = TextEditingController();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                      alignment: language == 1
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Text(
                        language == 1 ? "Register" : "إنشاء حساب",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                ],
              ),
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
                          height: 60,
                        ),
                        Form(
                          key: RegisterformKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "username"
                                      : " اسم المستخدم",
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
                                decoration: InputDecoration(
                                  hintText:
                                      language == 1 ? "phone" : "رقم الهاتف  ",
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
                                decoration: InputDecoration(
                                  hintText:
                                      language == 1 ? "Email" : " الايميل ",
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
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText:
                                      language == 1 ? "password" : "كلمة السر",
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
                                    Icons.password_outlined,
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
                                controller: confrimpasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "confirm password"
                                      : "  تاكيد كلمة السر ",
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
                                    Icons.password_outlined,
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
                                return loginPage(language);
                              }));
                            },
                            child: Text(
                              language == 1
                                  ? " Already have acount?log_in"
                                  : "لديك حساب؟تسجيل الدخول",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 78, 68, 68),
                                  fontSize: 20),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () async {
                            DatabaseHelper databaseHelper = DatabaseHelper();
                            await databaseHelper.registerData(
                                username: usernameController.text,
                                password: passwordController.text,
                                email: EmailController.text,
                                phoneNumber: phoneController.text,
                                gender: 'Male');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return loginPage(language);
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
                                language == 1 ? "Register" : "تسجيل",
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
