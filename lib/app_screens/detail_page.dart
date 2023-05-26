import "package:flutter/material.dart";
import 'package:flutter_application_7/mywidget/detail_widget.dart';

import '../mywidget/detail_appBar.dart';
import '../mywidget/detail_navigatorbar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.language,
      {super.key,
      required this.image,
      required this.id,
      required this.producttitle,
      required this.productDescription,
      required this.price});

  final String image;
  final String id;
  final String producttitle;
  final String price;
  final String productDescription;
  final int language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: detailnavigatorbar(
        price: '$price' ,
        language,
        id: id,
        name: producttitle,
        description: productDescription,
        image: image,
      ),
      backgroundColor: const Color(0xFFEDECF2),
      body: ListView(children: [
        detailpageappBar(),
        detailWidget(
            id: id,
            price: price,
            image: image,
            title: producttitle,
            content: productDescription,
            language)
      ]),
    );
  }
}
