import "package:flutter/material.dart";
import 'package:flutter_application_7/mywidget/constant.dart';
class orderappBar extends StatelessWidget{
  orderappBar(this.language, {super.key});

  final int language;

  
  @override
  Widget build(BuildContext context) {
   return Container(
    color: Colors.white,
    padding:EdgeInsets.all(25),
    child:language==1?
    Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
          
          size: 30,
          color: iconcolor,
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 20),
        child: Text("confirm your order ",
        style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: iconcolor
                ),
        ),
        

        ),
       
      ],
    ) :
    Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
          
          size: 30,
          color: iconcolor,
          ),
        ),
       
        
        
        Spacer(),
         Padding(padding: EdgeInsets.only(left: 20),
        child: Text("تاكيد الطلب",
        style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: iconcolor
                ),
        ),
        

        ),
      ],
    )
   );
  }

}