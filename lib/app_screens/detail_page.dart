import "package:flutter/material.dart";
import 'package:flutter_application_7/mywidget/detail_widget.dart';

import '../mywidget/detail_appBar.dart';
import '../mywidget/detail_navigatorbar.dart';
class DetailPage extends StatelessWidget{
 const DetailPage(this.language, {super.key});

  final int language;

  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    bottomNavigationBar: detailnavigatorbar(price: '3000', language),
    backgroundColor: const Color(0xFFEDECF2) ,
    body: ListView(children: [
      
      detailpageappBar(),
      detailWidget(image: "images/Picture7.jpg", title: "product Title",
       content: 'more detail about product more detail about product more detail about product more detail about product',language)
    ]),
   );
  }

}