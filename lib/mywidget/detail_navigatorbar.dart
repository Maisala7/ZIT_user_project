import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class detailnavigatorbar extends StatelessWidget{
  detailnavigatorbar(this.language, {super.key, required this.price});

  final String price;
  final int language;



  @override
  Widget build(BuildContext context) {
    
   return BottomAppBar(
     child: Container(
      height: 70,
      
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0,3)
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$price",
          style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold,
          color: iconcolor),),
          ElevatedButton.icon(
            onPressed: (){},
            icon: Icon(CupertinoIcons.cart_badge_plus),
            label: Text(language==1?"Add To Cart":"اضف الى العربه",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(iconcolor),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 13,horizontal: 15),
                
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ))

            ),
            )
        ],
      ),

     ),
   );
  }

}
