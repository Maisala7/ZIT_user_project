import 'package:flutter/material.dart';
class orderImagewidget extends StatelessWidget{
  final String image;
  const orderImagewidget({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
   return Container(
    
     child: Padding(
       padding: const EdgeInsets.all(5.0),
       child: Image.network("http://vzzoz.pythonanywhere.com$image",
       width: 150,
       height: 150,
       
       ),
     ),
     
     
   );

  }

}