import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/mywidget/product_appBar.dart';
import 'package:flutter_application_7/mywidget/product_widget.dart';

import '../mywidget/constant.dart';

class productpage extends StatelessWidget {
  productpage(this.language, {super.key, required this.categoryID});

  final int language;
  final String categoryID;
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    print(categoryID);
    return Scaffold(
      body: ListView(
        children: [
          productAppbar(language),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintTextDirection: language == 1
                                  ? TextDirection.ltr
                                  : TextDirection.rtl,
                              border: InputBorder.none,
                              hintText:
                                  language == 1 ? "search here.." : "بحث"),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: iconcolor,
                        size: 25,
                      )
                    ],
                  ),
                ),
                StreamBuilder(
                  stream: databaseHelper
                      .getCategoryProducts(catogory: categoryID)
                      .asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            if (snapshot.hasData) {
                              print('@@@@@@@@@@@@@@@@@@');
                              print(
                                snapshot.data![index]['id'].toString(),
                              );
                              return Padding(
                                padding: const EdgeInsets.only(top:10.0),
                                child: productWidget(
                                    id: snapshot.data![index]['id'].toString(),
                                    productDescription: '',
                                    image:
                                        snapshot.data![index]['Image'].toString(),
                                    producttitle:
                                        snapshot.data![index]['Name'].toString(),
                                    productCategory: snapshot.data![index]
                                            ['Description']
                                        .toString(),
                                    price:
                                        snapshot.data![index]['Price'].toString(),
                                    language),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          });
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
                // GridView.count(
                //   childAspectRatio: 0.68,
                //   crossAxisCount: 2,
                //   shrinkWrap: true,
                //   children: [
                // productWidget(
                //     productDescription: 'XXXXX',
                //     image: 'images/Picture6.jpg',
                //     producttitle: 'title',
                //     productCategory: 'hhhhhhh',
                //     price: '555',
                //     language),
                //     productWidget(
                //         productDescription: 'XX',
                //         image: "images/Picture7.jpg",
                //         producttitle: "ttttt",
                //         productCategory: 'jjjjju',
                //         price: '565',
                //         language),
                //     productWidget(
                //         productDescription: 'XX',
                //         image: "images/Picture7.jpg",
                //         producttitle: "ttttt",
                //         productCategory: 'jjjjju',
                //         price: '565',
                //         language),
                //     productWidget(
                //         productDescription: "",
                //         image: "images/Picture7.jpg",
                //         producttitle: "ttttt",
                //         productCategory: 'jjjjju',
                //         price: '565',
                //         language),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
