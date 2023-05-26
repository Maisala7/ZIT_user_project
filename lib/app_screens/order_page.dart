import "package:flutter/material.dart";
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/app_screens/orderState_page.dart';
import '../mywidget/constant.dart';
import '../mywidget/order_appBar.dart';

class orderpage extends StatelessWidget {
  orderpage(this.language);

  final int language;

  @override
  Widget build(BuildContext context) {
    final orderformKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final secondphoneController = TextEditingController();
    final addressController = TextEditingController();

    DatabaseHelper databaseHelper = DatabaseHelper();

    return Scaffold(
      body: ListView(
        children: [
          orderappBar(language),
          Container(
              height: 700,
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(children: <Widget>[
                        TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                hintText: language == 1 ? "Name" : "الاسم",
                                hintStyle: const TextStyle(
                                    color: iconcolor,
                                    fontWeight: FontWeight.bold),
                                hintTextDirection: language == 1
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                                fillColor: Colors.white,
                                suffixIcon: const Icon(
                                  Icons.person_add,
                                  color: iconcolor,
                                ))),
                        TextField(
                            controller: addressController,
                            decoration: InputDecoration(
                              hintText: language == 1 ? "Address" : "العنوان",
                              hintStyle: const TextStyle(
                                  color: iconcolor,
                                  fontWeight: FontWeight.bold),
                              hintTextDirection: language == 1
                                  ? TextDirection.ltr
                                  : TextDirection.rtl,
                              fillColor: Colors.white,
                              suffixIcon: const Icon(
                                Icons.home,
                                color: iconcolor,
                              ),
                            )),
                        TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              hintText:
                                  language == 1 ? "Phone number" : "رقم الهاتف",
                              hintStyle: const TextStyle(
                                  color: iconcolor,
                                  fontWeight: FontWeight.bold),
                              hintTextDirection: language == 1
                                  ? TextDirection.ltr
                                  : TextDirection.rtl,
                              fillColor: Colors.white,
                              suffixIcon: const Icon(
                                Icons.phone,
                                color: iconcolor,
                              ),
                            )),
                        TextField(
                          controller: secondphoneController,
                          decoration: InputDecoration(
                            hintText: language == 1
                                ? "Reserve number"
                                : "رقم احتياطي",
                            hintStyle: const TextStyle(
                                color: iconcolor, fontWeight: FontWeight.bold),
                            hintTextDirection: language == 1
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                            fillColor: Colors.white,
                            suffixIcon: const Icon(
                              Icons.phone,
                              color: iconcolor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: iconcolor),
                          child: Center(
                            child: GestureDetector(
                                onTap: () async {
                                  await databaseHelper.confirmOrder(
                                      details:
                                          '${nameController.text}\n${addressController.text}\n${phoneController.text}\n${secondphoneController.text}');
                                  if (databaseHelper.success) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return orderStatepage(language);
                                    }));
                                  } else {
                                    print('error on confirming order');
                                  }
                                },
                                child: Text(
                                  language == 1 ? "order" : "تأكيد",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          ),
                        ),
                      ]))))
        ],
      ),
    );
  }
}
