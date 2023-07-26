import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/cart_itemWidget.dart';

import 'constant.dart';

class gender extends StatefulWidget{
   final int language;

  const gender(this.language, {Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => genderState(language);
  }
  class genderState extends State< gender >{
     final int language;
     var Gender;

  genderState(this.language);
  @override
  Widget build(BuildContext context) {
   return 
   language==1?
    Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left:40.0),
        child: Text("Male",
       style: TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),),
      ),
      Radio(
        activeColor: iconcolor,
        value: "Male", groupValue: Gender, onChanged:(Val){
       setState(() {
         Gender=Val;
       });
      }),
       Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Text("Female",
       style: TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),),
      ),
      Radio(
        activeColor: iconcolor,
        value: "Female", groupValue: Gender, onChanged:(Val){
       setState(() {
         Gender=Val;
       });
      })


    ],
   ):
     Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left:20.0),
        child: Radio(
          activeColor: iconcolor,
          value: "Male", groupValue: Gender, onChanged:(Val){
         setState(() {
           Gender=Val;
         });
        }),
      ),
      Text("ذكر",
       style: TextStyle(
                                    color: iconcolor,
                                    fontWeight: FontWeight.bold),),
     
      Padding(
        padding: const EdgeInsets.only(left:150.0),
        
        child: Radio(
          activeColor: iconcolor,
          value: "Female", groupValue: Gender, onChanged:(Val){
         setState(() {
           Gender=Val;
         });
        }),
      ),
        Text("أنثى",
       style: TextStyle(
                                      color: iconcolor,
                                      fontWeight: FontWeight.bold),),



    ],
   );
   
  }

  }