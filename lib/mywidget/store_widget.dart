import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/home_page.dart';
import 'package:flutter_application_7/app_screens/login_page.dart';



class storewidget extends StatelessWidget{
  storewidget(this.language, {super.key, required this.image, required this.title, });
    
  final String title;
    final String image;
    final int language;


  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap:() => Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return homepage(language);})),
       

      
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15) ),
          elevation: 7,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight:Radius.circular(15),
                      topLeft: Radius.circular(15) ),
                      child: Image.asset('$image',
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover ,),
                    
                  ),
                  Container(
                    height: 250,
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter ,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.8)
                      ],
                      stops: [0.6,1]
                      )
                      
                    ),
                    child: Text('$title',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade,
                      color: Colors.white
                    ),),
                  )
                ],
              )
            ],
          ),
      ),
    );
  }

}