import "package:flutter/material.dart";
import 'package:flutter_application_7/mywidget/constant.dart';
 class detailpageappBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
    color: Colors.white ,
    padding: EdgeInsets.all(25),
    child: Row(children: [
      InkWell(
        onTap: () {
          Navigator.pop(context);

        },
        child: Icon(Icons.arrow_back,
        color: iconcolor,
        size: 30,),
),

                Spacer(),
                Icon(Icons.favorite,
                size: 30,
                color: Colors.red,)
    ]),
   );
  }

 }