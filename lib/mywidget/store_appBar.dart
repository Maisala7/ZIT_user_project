import "package:flutter/material.dart";
import 'package:flutter_application_7/mywidget/constant.dart';
class storeappBar extends StatelessWidget{
  final int language;
  storeappBar(this.language);
  @override
  Widget build(BuildContext context) {
   return Container(
    color: Colors.white,
    padding:EdgeInsets.all(25),
  
    child:language==1?
    Row(
      children: [
        Padding(padding: EdgeInsets.only(left: 20),
        child: Text("Stores",
        style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: iconcolor
                ),
        ),
        

        ),
        Spacer(),
        Icon(Icons.store,
        size: 30,
        color: iconcolor,)
      ],
    ) :
     Row(
      children: [
          Padding(
           padding: EdgeInsets.only(left: 20),
          
          child: Icon(Icons.store, 
          
          size: 30,
          color: iconcolor,
          ),
        ),
        Spacer(),
           Text("المتاجر",
        textAlign: TextAlign.right,
        style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: iconcolor
                ),
        ),
        

      
      ],
    ) ,
   );
  }

}