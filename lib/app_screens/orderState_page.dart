
import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/order_widget.dart';
import '../mywidget/constant.dart';
import '../mywidget/orderState_appar.dart';

class orderStatepage extends StatelessWidget{
  orderStatepage(this.language);

  final int language;

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:ListView( 
        children: [
         orderStateappBar(language),
         Container(
          height: 700,
          padding: EdgeInsets.only(top: 15),
          decoration:BoxDecoration(
            color: Color(0xFFEDECF2),
           
          ) ,
          child:ListView(children: [
            orderWidget(language, Date: '22/1/2000', orderState: 'DELIVERD',),
             orderWidget(language, Date: '22/1/2000', orderState: 'DELIVERD',),

            

             SizedBox(height: 20,),
                     Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: iconcolor
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                
                              },
                              child: Text(language==1?"log out":"تسجل خروج", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                          ),
                        ),
          ]) ,
          
         )
          ]));}}