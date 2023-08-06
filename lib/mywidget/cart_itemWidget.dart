import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/mywidget/constant.dart';
import 'package:flutter_application_7/mywidget/counter.dart';

class cartItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String id;
    final VoidCallback? onCounterChanged;

  DatabaseHelper databaseHelper = DatabaseHelper();
  cartItemWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.id,
          this.onCounterChanged,

      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 125,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              // Radio(
              //   value: "",
              //   groupValue: "",
              //   onChanged: (index) {},
              //   activeColor: iconcolor,
              // ),
              Container(
                height: 70,
                width: 75,
                margin: EdgeInsets.only(right: 15),
                child: Image.network("https://vzzoz.pythonanywhere.com/$image",),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$title",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 15,
                          color: iconcolor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$price",
                      style: TextStyle(
                          fontSize: 14,
                          color: iconcolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: ()async {
                          await databaseHelper.removeProductFromCart(productID: id);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: SizedBox(
                            child: MainScreen(
                          productID: id,
                                    onCounterChanged: onCounterChanged,

                        )),
                      ),
                    ]),
              )
            ],
          ),
        )
      ],
    );
  }
}
