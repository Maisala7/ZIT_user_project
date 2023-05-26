import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/cart_page.dart';
import 'package:flutter_application_7/app_screens/home_page.dart';
import 'package:flutter_application_7/app_screens/orderState_page.dart';

import 'constant.dart';

class homenavpage extends StatefulWidget {
  final int language;
  final String storeName;
  final String storeID;

  homenavpage(this.language, {required this.storeName, required this.storeID});

  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return homenavpageState(language, storeName: storeName, storeID: storeID);
  }
}

class homenavpageState extends State<homenavpage> {
  final int language;
//  int index=0;
  final String storeName;
  final String storeID;
  // int selectedIndex=0;

  homenavpageState(this.language,
      {required this.storeName, required this.storeID});

  @override
  Widget build(BuildContext context) {
    // final Pages=[
    //   homepage(language),
    //   cartpage(language),
    //   orderStatepage(language)

    // ];

    return BottomAppBar(
        child: Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: iconcolor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3))
          ]),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return homepage(
                        storeID: storeID,
                        language,
                        storeName: storeName,
                      );
                    })),
                child: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: GestureDetector(
                onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return cartpage(language);
                    })),
                child: const Icon(
                  CupertinoIcons.cart,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: GestureDetector(
                onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return orderStatepage(language);
                    })),
                child: const Icon(
                  Icons.list_sharp,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    ));
  }
}
















//Container(
//      child: Scaffold(

//       bottomNavigationBar: CurvedNavigationBar(
//         index: selectedIndex,
//         backgroundColor:Colors.transparent,
        
  
//          height: 50,
//           color: iconcolor,
//              items: <Widget>[
//               Icon(Icons.home, size: 30,color: Colors.white,),
//               Icon(CupertinoIcons.cart, size: 30,color: Colors.white,),
//               Icon(Icons.list, size: 30,color: Colors.white,),
//       ],
//       onTap: (index) {
//         setState(() {
//           selectedIndex=index;
//         });
//         //Handle button tap
//       },
//   ),











// Scaffold(
//       bottomNavigationBar: NavigationBar(
//       backgroundColor: iconcolor,
//       surfaceTintColor: Colors.white,
//       selectedIndex: index,
//       onDestinationSelected: (index)=>setState(() {
//         this.index=index;
//       }),
//       height: 60,
//       destinations: [
//         NavigationDestination(
//           icon:  Icon(Icons.home, size: 30,color: Colors.white,), label: "home",
//          ),
//           NavigationDestination(
//           icon:  Icon(CupertinoIcons.cart, size: 30,color: Colors.white,), label: "home",
//          ),
//           NavigationDestination(
//           icon:  Icon(Icons.monetization_on, size: 30,color: Colors.white,), label: "home",
//          )
//          ],),
//  body:Pages[index],
  
     
//    );