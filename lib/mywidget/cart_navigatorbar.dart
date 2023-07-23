import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/app_screens/order_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class cartnavigatorbar extends StatefulWidget{
   final int language;

  cartnavigatorbar(this.language, {super.key});
  
  @override
  State<StatefulWidget> createState() =>cartnavigatorbarState(language);
  }

  class cartnavigatorbarState extends State<cartnavigatorbar> {
   final int language;
  
  DatabaseHelper databaseHelper = DatabaseHelper();

  cartnavigatorbarState(this.language);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
              future: databaseHelper.updateCartTotal(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: iconcolor),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton.icon(
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return orderpage(language);
              })),
              label: Text(
                language == 1 ? "Next" : " التالي ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              icon: Icon(Icons.add),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(iconcolor),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
            )
          ],
        ),
      ),
    );
  }
  }

  
