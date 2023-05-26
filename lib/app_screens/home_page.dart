import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/apiRequests.dart';
import 'package:flutter_application_7/mywidget/home_navigatorbar.dart';

import '../mywidget/Items_widget.dart';
import '../mywidget/categorise_widget.dart';
import '../mywidget/constant.dart';
import '../mywidget/homeappBar.dart';
import 'cart_page.dart';
import 'orderState_page.dart';

class homepage extends StatefulWidget {
  homepage(
    this.language, {
    required this.storeName,
    required this.storeID,
  });

  final int language;
  final String storeName;
  final String storeID;

  @override
  State<StatefulWidget> createState() {
    return homepageState(language, storeName: storeName, storeID: storeID);
  }
}

class homepageState extends State<homepage> {
  final int language;
  final String storeName;
  final String storeID;

  DatabaseHelper databaseHelper = DatabaseHelper();
  String searchQuery = '';

  homepageState(this.language,
      {required this.storeName, required this.storeID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: homenavpage(
        storeID: storeID,
        language,
        storeName: storeName,
      ),
      body: ListView(
        children: [
          homeAppbar(
            language,
            storeName: storeName,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintTextDirection: language == 1
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                            hintText: language == 1 ? "search here.." : "بحث",
                          ),
                        ),
                      ),
                      Spacer(),
                      const Icon(
                        Icons.search,
                        color: iconcolor,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Align(
                    alignment:
                        language == 1 ? Alignment.topLeft : Alignment.topRight,
                    child: Text(
                      language == 1 ? "Categorise" : "الفئات",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: iconcolor,
                      ),
                    ),
                  ),
                ),
                // Categorise
                StreamBuilder(
                  stream: databaseHelper
                      .getStoreCategories(storeID: storeID)
                      .asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      final categories = data;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(categories!.length, (index) {
                            final category = categories[index];
                            return categorisewidget(
                              categoryID: category['id'].toString(),
                              image: category['Image'].toString(),
                              title: category['Name'].toString(),
                              language,
                            );
                          }),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Align(
                    alignment:
                        language == 1 ? Alignment.topLeft : Alignment.topRight,
                    child: Text(
                      language == 1 ? "All Products" : "جميع المنتجات",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: iconcolor,
                      ),
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: databaseHelper
                      .getStoreProducts(storeID: storeID)
                      .asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<dynamic> data = snapshot.data as List<dynamic>;
                      final List<Map<String, dynamic>> products =
                          data.cast<Map<String, dynamic>>();

                      // Filter products based on search query
                      final filteredProducts = products.where((product) {
                        final productName = product['Name'].toString().toLowerCase();
                        final query = searchQuery.toLowerCase();
                        return productName.contains(query);
                      }).toList();

                      return GridView.builder(
                        itemCount: filteredProducts.length,
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return ItemWidget(
                            id: product['id'].toString(),
                            image: product['Image'].toString(),
                            productDescription:
                                product['Description'].toString(),
                            producttitle: product['Name'],
                            productCategory: product['Category'].toString(),
                            price: product['Price'].toString(),
                            language,
                          );
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
