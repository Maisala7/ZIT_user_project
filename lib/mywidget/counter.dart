import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int value = 1;

  void add() {
    setState((){
      value ++;
    });
  }

  void subtract() {
    setState((){
      value --;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
       // SizedBox(height: 40.0),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
        )
      ]
    ),
              child: IconButton(
                icon: Icon(Icons.add,
                size: 20,
                color:iconcolor,),
               
                onPressed: (){
                  add();
                },
               
              ),
            ),
             Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Text(' $value',
            style: const TextStyle(
              fontSize: 17.0,
              color: iconcolor
            ),
          ),
        ),
            //SizedBox(width: 10.0),
            Container(
              
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
        )
      ]
    ),
              child: IconButton(
               icon: Icon(CupertinoIcons.minus,
               color: iconcolor,
               size: 20,),
                onPressed: (){
                  subtract();
                },
              
              ),
            ),
          ],
        ),
      ],
    );
    
  }
}
 