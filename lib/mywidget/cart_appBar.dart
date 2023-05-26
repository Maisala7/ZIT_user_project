import "package:flutter/material.dart";
import 'package:flutter_application_7/app_screens/cart_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class cartappBar extends StatelessWidget {
  cartappBar(this.language, {super.key});

  final int language;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(25),
        child: language == 1
            ? Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: iconcolor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Cart",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: iconcolor),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: iconcolor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return cartpage(language);
                        },
                      ));
                    },
                    child: Icon(
                      Icons.refresh,
                      size: 30,
                      color: iconcolor,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "سلتك",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: iconcolor),
                    ),
                  ),
                ],
              ));
  }
}
