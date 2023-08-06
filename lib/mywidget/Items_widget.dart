import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/app_screens/detail_page.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget(
    this.language, {
    Key? key,
    required this.image,
    required this.producttitle,
    required this.id,
    required this.productCategory,
    required this.productDescription,
    required this.price,
  });

  final String image;
  final String producttitle;
  final String productCategory;
  final String price;
  final String id;
  final String productDescription;
  final int language;
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
 double screenWidth = MediaQuery.of(context).size.width;
     double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 70,
    //  padding: EdgeInsets.only(left: 15, top: 12, right: 15),
      margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailPage(
                  id:id,
                  language,
                  price: price.toString(),
                  productDescription: productDescription.toString(),
                  image: image.toString(),
                  producttitle: producttitle.toString(),
                );
              }),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:8.0,left: 5,right: 5),
              child: Image.network('http://vzzoz.pythonanywhere.com$image',height: 75,width: double.infinity,),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () async {
                await databaseHelper.addToCart(
                    id: id,
                    name: producttitle,
                    price: price,
                    image: image,
                    description: productDescription);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$producttitle",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    color: iconcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Text(
          //     "$productCategory",
          //     textAlign: TextAlign.justify,
          //     style: TextStyle(
          //       fontSize: 12,
          //       color: iconcolor,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 10,top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$price SDG",
                  style: TextStyle(
                    fontSize: 15,
                    color: iconcolor,
                    fontWeight: FontWeight.bold,
                  ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
