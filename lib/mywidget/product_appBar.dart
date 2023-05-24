import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/cart_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';
class productAppbar extends StatelessWidget{
  productAppbar(this.language, {super.key});

  final int language;

  
  @override
  Widget build(BuildContext context) {
   return Container(
    color: Colors.white,
    padding: EdgeInsets.all(25),
    child:language==1?
     Row(
      children: [
        // Icon(Icons.sort,
        // size: 20,
        // color: iconcolor,
        // ),
        Padding(padding: EdgeInsets.only(left: 20),
        child:Text("Products categorise name",
        style: TextStyle(fontSize: 23,
        fontWeight: FontWeight.bold,
        color: iconcolor),
        ),
        
    ),
    Spacer(),
    Badge(
      badgeColor: Colors.red,
      padding: EdgeInsets.all(7),
      badgeContent: Text("3",
      style: TextStyle(color: Colors.white),
      ),
     child: InkWell(
      onTap: ()=>
       Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return cartpage(language);})),
      
      child: Icon(Icons.shopping_bag_outlined,
      size: 30,
      color: iconcolor,),
     ), 
    )
    ],
    ):
    Row(
      children: [
       
    Badge(
      badgeColor: Colors.red,
      padding: EdgeInsets.all(7),
      badgeContent: Text("3",
      style: TextStyle(color: Colors.white),
      ),
     child: InkWell(
      onTap: ()=>
        Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return cartpage(language);})),
      
      child: Icon(Icons.shopping_bag_outlined,
      size: 30,
      color: iconcolor,),
     ), 
    ),
    Spacer(),

     
        Padding(padding: EdgeInsets.only(left: 20),
        child:Text("اسم المنتجات",
        style: TextStyle(fontSize: 23,
        fontWeight: FontWeight.bold,
        color: iconcolor),
        ),
        
        
    ),
    // Icon(Icons.sort,
    //     size: 20,
    //     color: iconcolor,
    //     ),
    ],
    ),
   );
  }

}