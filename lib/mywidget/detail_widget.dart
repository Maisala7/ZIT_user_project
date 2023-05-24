

import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/constant.dart';
import 'package:flutter_application_7/mywidget/counter.dart';
class detailWidget extends StatelessWidget{
  detailWidget(this.language, {super.key, required this.image, required this.title, required this.content});

  final String image;
  final String title;
  final String content;
  final int language;

  @override
  Widget build(BuildContext context) {
   return 
   Column(
     children: [
       Padding(
         padding: const EdgeInsets.all(16),
         child: Image.asset("$image",
         height: 300,),
       ),
       Arc(
        edge:Edge.TOP,
        arcType: ArcType.CONVEY,
        height: 35,
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 50,bottom: 20),
              child: Align(
              alignment: language==1?Alignment.topLeft:Alignment.topRight,

                child: Text("$title",
                               // textDirection: language==1?TextDirection.ltr:TextDirection.rtl,
                style: TextStyle(
                  fontSize: 28,
                  color: iconcolor,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),),
              Padding(padding: EdgeInsets.symmetric(vertical: 12),
              child: Align(
                  alignment: language==1?Alignment.topLeft:Alignment.topRight,
                child: Text("$content",
                textAlign: TextAlign.justify,
                style: TextStyle(
                      fontSize: 17,
                      color: iconcolor,
                    
                    ),
                    ),
              ),),
                  
            ],
          ),
          ),
        ),
       )
     ],
   );
  
  }

}