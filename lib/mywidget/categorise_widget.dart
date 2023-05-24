import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/product_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';
class categorisewidget extends StatelessWidget{
  categorisewidget(this.language, {super.key, required this.image, required this.title, });

  final String image;
  final String title;
  final int language;

  
  @override
  Widget build(BuildContext context) {
   return InkWell(
    onTap: () {
      Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return productpage(language);}));
    },
     child: Row(children: [
       Container(
         margin: EdgeInsets.symmetric(horizontal: 10),
         padding:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(20)
         ),
         child: Row(
           children: [
             Image.asset("$image",
             width: 40,
             height: 40,
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("$title",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 16,
                 color: iconcolor,
               ),),
             )
           ],
         ),
         
         
       )
     ],),
   );

  }

}