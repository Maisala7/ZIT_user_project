import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/detail_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

import '../api/apiRequests.dart';

class productWidget extends StatelessWidget {
  final String image;
  final String id;
  final String producttitle;
  final String productCategory;
  final String productDescription;
  final String price;
  final int language;
  DatabaseHelper databaseHelper = DatabaseHelper();


  productWidget(this.language,
      {super.key,
      required this.image,
      required this.id,
      required this.producttitle,
      required this.productCategory,
      required this.productDescription,
      required this.price,
      });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
     // width: 80,
       // padding: EdgeInsets.only(left: 15, top: 12, right: 15),
        margin: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            InkWell(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(
                  id:id,
                  language,
                  image: image,
                  price: price,
                  producttitle: producttitle,
                  productDescription: productDescription,
                );
              })),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.network(
                  "https://vzzoz.pythonanywhere.com/$image",
                  height: 75,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "$producttitle",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 15,
                    color: iconcolor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Container(
            //   // padding: EdgeInsets.only(bottom: 8),
            //   alignment: Alignment.center,
            //   child: Text(
            //     "$productCategory",
            //     style: TextStyle(
            //         fontSize: 17,
            //         color: iconcolor,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            Padding(
                padding:EdgeInsets.only(left: 10,top: 24),
                // EdgeInsets.symmetric(vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$price",
                        style: TextStyle(
                            fontSize: 15,
                            color: iconcolor,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                  onPressed: () async {
                          print('here');
                          await databaseHelper.addToCart(
                              id: id,
                              name: producttitle,
                              price: price,
                              image: image,
                              description: productDescription
                              );
                        },
                  icon: Icon(
                    Icons.shopping_cart_checkout,
                    color: iconcolor,
                  ),
                ),
                      // Icon(
                      //   Icons.shopping_cart_checkout,
                      //   color: iconcolor,
                      // )
                    ]))
          ],
        ));
  }
}
