import "package:flutter/material.dart";
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/mywidget/cart_navigatorbar.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

import '../mywidget/cart_appBar.dart';
import '../mywidget/cart_itemWidget.dart';

class cartpage extends StatefulWidget {
  cartpage(this.language);
  final int language;

  @override
  State<cartpage> createState() => _cartpageState();
}

class _cartpageState extends State<cartpage> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  void rebuildCartNavigatorBar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: cartnavigatorbar(widget.language,),
      body: ListView(
        children: [
          cartappBar(widget.language),
          Container(
              height: 700,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
              child: StreamBuilder(
                stream: databaseHelper.getCartProducts().asStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      primary: false,
                      itemBuilder: (context, index) {
                        print(snapshot.data);
                        return cartItemWidget(
                            id: snapshot.data![index]['id'],
                            image: snapshot.data![index]['Image'],
                            price: snapshot.data![index]['Price'],
                            title: snapshot.data![index]['Name'],
r
                                                  onCounterChanged: rebuildCartNavigatorBar,


                            );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )),
        ],
      ),
    );
  }
}
