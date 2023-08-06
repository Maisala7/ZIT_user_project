import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/mywidget/order_widget.dart';
import '../mywidget/constant.dart';
import '../mywidget/orderState_appar.dart';

class orderStatepage extends StatelessWidget {
  orderStatepage(this.language);

  final int language;
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      orderStateappBar(language),
      Container(
        height: 700,
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Color(0xFFEDECF2),
        ),
        child: ListView(
          children: [
            StreamBuilder(
              stream: databaseHelper.getMyOrders().asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length - 1,
                    itemBuilder: (context, index) {
                      return orderWidget(language,
                      ordersImages:snapshot.data![index]['OrderItems'] ,
                          Date: snapshot.data![index]['CreatedOn']
                              .toString()
                              .substring(0, 16),
                          orderState: snapshot.data![index]['Status']);
                    },
                  );
                } else {
                  return Center(child: const CircularProgressIndicator(
                    color: iconcolor,
                  ));
                }
              },
            ),
            // Container(
            //   height: 50,
            //   margin: EdgeInsets.symmetric(horizontal: 50),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(50), color: iconcolor),
            //   child: Center(
            //     child: GestureDetector(
            //         onTap: () {},
            //         child: Text(
            //           language == 1 ? "log out" : "تسجل خروج",
            //           style: TextStyle(
            //               color: Colors.white, fontWeight: FontWeight.bold),
            //         )),
            //   ),
            // ),
          ],
        ),
        // ListView(children: [
        // orderWidget(
        //   language,
        //   Date: '22/1/2000',
        //   orderState: 'DELIVERD',
        // ),
        //   orderWidget(
        //     language,
        //     Date: '22/1/2000',
        //     orderState: 'DELIVERD',
        //   ),
        //   SizedBox(
        //     height: 20,
        //   ),
      )
    ]));
  }
}
