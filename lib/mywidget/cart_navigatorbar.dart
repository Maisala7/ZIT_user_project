import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/order_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class cartnavigatorbar extends StatelessWidget{
  const cartnavigatorbar(this.language, {super.key, required this.total});

  final String total;
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
          Text("$total",
          style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold,
          color: iconcolor),),
          ElevatedButton.icon(
            onPressed: ()=>Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return orderpage(language);})),
           
            label: Text(language==1?"Next":" التالي ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
             icon: Icon(Icons.add),

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
