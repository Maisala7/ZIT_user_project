import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/product_appBar.dart';
import 'package:flutter_application_7/mywidget/product_widget.dart';

import '../mywidget/constant.dart';
 class productpage extends StatelessWidget{
productpage(this.language, {super.key});

  final int language;

   
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: ListView(
      children: [
      productAppbar(language),
      Container(
          height: 700,
          padding: EdgeInsets.only(top: 15),
          decoration:BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight:Radius.circular(35), 
            )
          ) ,
          child: Column(
            children: [
                Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding:EdgeInsets.symmetric(horizontal: 15), 
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)             
                 ),
                 child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintTextDirection: language==1?TextDirection.ltr:TextDirection.rtl,
                          border: InputBorder.none,
                          hintText: language==1? "search here..":"بحث"
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
               GridView.count(
                childAspectRatio: 0.68,
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  productWidget(image: 'images/Picture6.jpg', producttitle: 'title', productdescr: 'hhhhhhh', price: '555', language),
                  productWidget(image: "images/Picture7.jpg", producttitle: "ttttt", productdescr: 'jjjjju', price: '565', language),
                  productWidget(image: "images/Picture7.jpg", producttitle: "ttttt", productdescr: 'jjjjju', price: '565', language),
                  productWidget(image: "images/Picture7.jpg", producttitle: "ttttt", productdescr: 'jjjjju', price: '565', language),


                ],
                
              ),

            ],
          ),
     ) ,
     
    
     ],
    ),
   );
  }
 }