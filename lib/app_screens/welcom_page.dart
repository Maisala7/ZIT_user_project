import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/Register_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class welcomPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor:Color(0xFFEDECF2),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:250.0),
          child: Center(child: Icon(Icons.store_outlined,
          color: iconcolor,
          size: 150,),),
        ),
      Padding(
        padding: const EdgeInsets.only(top:100.0,left: 80),
        child: Column(
          
          children: [
            Row(
              children: [
                Icon(Icons.language_sharp,
                color:iconcolor,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return registerPage (1);})),
                  child: Text("English",
                  style: TextStyle(
                    color: iconcolor,
                    fontSize: 25,
                  ),),
                ),
              )
              
              ],
            ),
             Row(
                children: [
                  Icon(Icons.language_sharp,
                  color: iconcolor,
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: ()=>Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return registerPage(2);})),
                    child: Text("العربيه",
                    style: TextStyle(
                      color:iconcolor,
                      fontSize: 25,
                    ),),
                  ),
                )
                
                ],
              ),
          ],
        ),
      )
       
      ],
    ),
   );
  }

}