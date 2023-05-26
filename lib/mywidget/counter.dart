import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/mywidget/constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.productID}) : super(key: key);
  final String productID;
  @override
  State<MainScreen> createState() => _MainScreenState(productID: productID);
}

class _MainScreenState extends State<MainScreen> {
  _MainScreenState({required this.productID});
  final String productID;

  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          databaseHelper.getProductQuantity(productID: productID).asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int quantity = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        ]),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 20,
                        color: iconcolor,
                      ),
                      onPressed: () {
                        if (quantity == 0) {
                        } else {
                          setState(() {
                            quantity++;
                            databaseHelper.updateProductQuantity(
                                productID: productID, newQuantity: quantity);
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      ' $quantity ',
                      style: const TextStyle(fontSize: 17.0, color: iconcolor),
                    ),
                  ),
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
                        ]),
                    child: IconButton(
                      icon: Icon(
                        CupertinoIcons.minus,
                        color: iconcolor,
                        size: 20,
                      ),
                      onPressed: () {
                        if (quantity == 1) {
                          databaseHelper.removeProductFromCart(
                              productID: productID);
                        } else {
                          setState(() {
                            quantity--;
                            databaseHelper.updateProductQuantity(
                                productID: productID, newQuantity: quantity);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
