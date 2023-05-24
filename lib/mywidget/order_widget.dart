import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/order_image_widget.dart';

import 'constant.dart';

class orderWidget extends StatelessWidget{
  orderWidget(this.language, {super.key, required this.Date, required this.orderState});

  final int language;
  final String Date;
  final String orderState ;

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
      
       Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 2),
          color: Color(0xFFEDECF2),
          child:language==1?
            Row(
            children: [
              Text(language==1?"order date:":":تاريخ الطلبيه",
               style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 108, 107, 107),

                      
                      ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("$Date",
               style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 108, 107, 107),
                        
                        ),),
                      ), 
                      Spacer(),
                       Text("$orderState",
                textAlign: TextAlign.left,
                   style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 108, 107, 107),

                          
                          ),),
            ],
          ):

           Row(
            children: [
               Text("$orderState",
                textAlign: TextAlign.left,
                   style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 108, 107, 107),

                          
                          ),),
               
              Spacer(),
               Text("$Date",
               style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 108, 107, 107),
                
                ),),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(language==1?"order date:":":تاريخ الطلبيه",
                 style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 108, 107, 107),

                        
                        ),),
              ),
              
                     
            ],
          ),
          
       ),
       Container(height: 2, width: double.infinity,color: Color.fromARGB(255, 108, 107, 107),),
         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              orderImagewidget(image: "images/Picture5.jpg"),
              orderImagewidget(image: "images/Picture7.jpg"),
              orderImagewidget(image: "images/Picture6.jpg"),
              orderImagewidget(image: "images/Picture7.jpg"),

            ],
          ),
      ),
       Padding(
         padding: const EdgeInsets.only(bottom: 30),
         child: Container(height: 2, width: double.infinity,color: Color.fromARGB(255, 108, 107, 107),),
       ),
       
       
         
       
        

       
     ],
   );
  }

}