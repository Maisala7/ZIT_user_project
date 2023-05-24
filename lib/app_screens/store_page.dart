 
 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/constant.dart';
import 'package:flutter_application_7/mywidget/store_widget.dart';

import '../mywidget/store_appBar.dart';

class Storepage extends StatefulWidget {
  final int language;

  const Storepage(this.language, {super.key});
  
  @override
  State<StatefulWidget> createState() {
    return StorepageState(language);
  }
}
  class StorepageState extends State<Storepage>{
    final int language;

  StorepageState(this.language);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder:(BuildContext context,BoxConstraints constraints){
          return Scaffold(
            body: ListView(children: [
            storeappBar(language),

              Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding:EdgeInsets.symmetric(horizontal: 15), 
              height: 50,
              decoration: BoxDecoration(
                color:  Color(0xFFEDECF2),
                borderRadius: BorderRadius.circular(30)             
                 ),
                 child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintTextDirection: language==1?TextDirection.ltr:TextDirection.rtl,
                          hintText:language==1? "search here..":"بحث"
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.search,
                    color: iconcolor,
                    size: 25,)
                  ],
                 ),
              
              ),
          
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(
                children: [
         storewidget(image: "images/im.jpj.jpg", title: "ZIT",language),
         storewidget(image: "images/im.jpj.jpg", title: "ZIT",language,),
         storewidget(image: "images/im.jpj.jpg", title: "ZIT",language),

                ],
              ),
            )
          

            ]),
          )
          ; }));}}

