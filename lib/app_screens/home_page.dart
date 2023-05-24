import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/home_navigatorbar.dart';


import '../mywidget/Items_widget.dart';
import '../mywidget/categorise_widget.dart';
import '../mywidget/constant.dart';
import '../mywidget/homeappBar.dart';
import 'cart_page.dart';
import 'orderState_page.dart';
class homepage extends StatefulWidget{
  homepage(this.language);

  final int language;

  
  State<StatefulWidget> createState() {
    return homepageState(language);
}
}
class homepageState extends State<homepage>{
    final int language;
   


  
  // int _selectedIndex=0;

  homepageState(this.language);
  @override
  Widget build(BuildContext context) {
 
   return Scaffold(
           
    bottomNavigationBar:   homenavpage(language),
    body: ListView( 
          children: [
           homeAppbar(language),
           Container(
            //height: 500,
            padding:const EdgeInsets.only(top: 15),
            decoration:BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft:
                 Radius.circular(35),
                topRight:Radius.circular(35), 
              )
            ) ,
            child: Column(children: [
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 15),
                padding:const EdgeInsets.symmetric(horizontal: 15), 
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30)             
                   ),
                   child: Row(
                    children: [
                      Container(
                        margin:const EdgeInsets.only(left: 5),
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
                     const Icon(Icons.search,
                      color: iconcolor,
                      size: 25,)
                    ],
                   ),
                
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Align(
                    alignment: language==1?Alignment.topLeft:Alignment.topRight,
                    child: Text(language==1?"Categorise":"الفئات",
                    style:const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: iconcolor
                    ),
                    ),
                  ),
                ),
                //categorise
                 SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                child: Row(
                  children:  [
                     categorisewidget(image: 'images/im.jpj.jpg', title: 'laptops',language),
                     categorisewidget(image: 'images/im.jpj.jpg', title: 'laptops',language),
                     categorisewidget(image: 'images/im.jpj.jpg', title: 'laptops',language),
                     categorisewidget(image: 'images/im.jpj.jpg', title: 'laptops',language),
                  ],
                )
               ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child:Align (
                    alignment: language==1?Alignment.topLeft:Alignment.topRight,
                   child: Text(language==1?"Best selling":"الاكثر مبيعا",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: iconcolor
                    ),
                    ),
                  ),
                ), 
                
                GridView.count(
                  childAspectRatio: 0.68,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children:  [
                    ItemWidget(image: 'images/Picture6.jpg', producttitle: 'العنوان', productdescr: 'hhhhhhh', price: '555', language),
                    ItemWidget(image: "images/Picture7.jpg", producttitle: "ttttt", productdescr: 'jjjjju', price: '565', language),
                    ItemWidget(image: "images/Picture7.jpg", producttitle: "ttttt", productdescr: 'jjjjju', price: '565', language),
   
                  ],
                  
                ),
              
                  
              
   
            ]),
           )
        ],
     
       
     ),
   );}
}