import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/detail_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';
class productWidget extends StatelessWidget{
  final String image;
  final String producttitle;
  final String productdescr;
  final String price;
  final int language;


  

  productWidget(this.language, {super.key, required this.image, required this.producttitle, required this.productdescr, required this.price});
  
  @override
  Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 15,top: 10,right: 15),
    margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20)
    ),
    child: Column(children: [
     InkWell(
      onTap: () =>
       Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DetailPage(language);})),
      
      child: Container(
        margin: EdgeInsets.all(10),
        child: Image.asset("$image",
        height: 150,
        width: 150,),

      ),

     ),
     Container(
      
      alignment:Alignment.center,
      child: Text("$producttitle",
      style: TextStyle(
        fontSize: 18,
        color: iconcolor,
        fontWeight:FontWeight.bold
      ),),
     ),
      Container(
     // padding: EdgeInsets.only(bottom: 8),
      alignment:Alignment.center,
      child: Text("$productdescr",
      style: TextStyle(
        fontSize: 17,
        color: iconcolor,
        fontWeight:FontWeight.bold
      ),),
     ),
     Padding(padding: EdgeInsets.symmetric(vertical: 10),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$price",
         style: TextStyle(
        fontSize: 15,
        color: iconcolor,
        fontWeight:FontWeight.bold
      ),),
      Icon(Icons.shopping_cart_checkout,
      color: iconcolor,
      )
      ]) 

     ) ],)
     
    

  );
  }

}