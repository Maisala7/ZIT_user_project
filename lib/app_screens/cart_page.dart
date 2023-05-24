import "package:flutter/material.dart";
import 'package:flutter_application_7/mywidget/cart_navigatorbar.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

import '../mywidget/cart_appBar.dart';
import '../mywidget/cart_itemWidget.dart';
class cartpage extends StatelessWidget{
   cartpage(this.language);

  final int language;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
   bottomNavigationBar:cartnavigatorbar(language, total: "23000"),
    
    body: ListView(
      children: [
       cartappBar(language),
        Container(
          height: 700,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35)
              ),
              
          ),
          child: Column(
            children: [
              cartItemWidget(image: 'images/im.jpj.jpg', price: '3000', title: 'kkkk',),
              cartItemWidget(image: 'images/im.jpj.jpg', price: '3000', title: 'kkllk',),
              cartItemWidget(image: 'images/im.jpj.jpg', price: '3000', title: 'kkllk',),
              
               
             

            ],
          ),
          
          
        ),

      ],
    ),
  );
  }

}