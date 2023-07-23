import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/cart_page.dart';
import 'package:flutter_application_7/app_screens/home_page.dart';
import 'package:flutter_application_7/app_screens/login_page.dart';
import 'package:flutter_application_7/app_screens/orderState_page.dart';
import 'package:flutter_application_7/app_screens/product_page.dart';

import 'constant.dart';

class FluidNavBarDemo extends StatefulWidget {
  final int language;


 FluidNavBarDemo(this.language,);
  

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _FluidNavBarDemoState createState() => _FluidNavBarDemoState(language);
}

class _FluidNavBarDemoState extends State<FluidNavBarDemo> {
   final int language;
 
  // ignore: prefer_typing_uninitialized_variables
  var _child ;

  _FluidNavBarDemoState(this.language);
  


  @override
  void initState() {
    super.initState();
    _child = homepage(language,storeID: '', storeName: '',);
  }

  Widget build(BuildContext context) {
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
                        storeID: "storeID",
                        language,
                        storeName: "storeName",
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
      























//  class homenavpage extends StatefulWidget {
//     final int language;
//  homenavpage(this.language,);
  


//   @override
//   State<StatefulWidget> createState() =>homenavpageState(language);  
// }

//  class homenavpageState extends State<homenavpage> {
//   Widget widget;
// final items = const[
//    Icon(Icons.shopping_bag ,size: 30,color: Colors.white,),
//    Icon(Icons.home,size: 30,color: Colors.white,),
//    Icon(Icons.list,size: 30,color: Colors.white,),];
//    int index=1;
//     final int language;
//   homenavpageState(this.language);
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      bottomNavigationBar: CurvedNavigationBar(
//       items:items,
//       index: index,
//       onTap: (selctedIndex){
//         setState(() {
//           index = selctedIndex;
//         });},
//       height: 70,
//       color: iconcolor,
//       backgroundColor: Colors.transparent,
//       animationDuration: Duration(milliseconds: 360),
//       ),
// body: Container(
//             height: double.infinity,
//             width: double.infinity,
//           child: getSelectedwidget(index: index),
//           ),
//    );

//  }
//   void getSelectedwidget({required int index}){
     
//    setState(() {
     
//     switch(index){

//       case 0:
//        widget=cartpage(language);
      
//       break;
//        case 1:
//       widget= homepage(language, storeName: "storeName", storeID: "storeID");

//        break;
//         case 2:
//         widget=orderStatepage(language);
//         break;
        
        
//     }
//     return widget;
//    });
   

// }
//  }

// //   homenavpageState(this.language,
// //       {required this.storeName, required this.storeID});

// //   @override
// //   Widget build(BuildContext context) {
// //     final Pages=[
// //       homepage(language),
// //       cartpage(language),
// //       orderStatepage(language)

// //     ];

// //     return
















// //Container(
// //      child: Scaffold(

// //       bottomNavigationBar: CurvedNavigationBar(
// //         index: selectedIndex,
// //         backgroundColor:Colors.transparent,
        
  
// //          height: 50,
// //           color: iconcolor,
// //              items: <Widget>[
// //               Icon(Icons.home, size: 30,color: Colors.white,),
// //               Icon(CupertinoIcons.cart, size: 30,color: Colors.white,),
// //               Icon(Icons.list, size: 30,color: Colors.white,),
// //       ],
// //       onTap: (index) {
// //         setState(() {
// //           selectedIndex=index;
// //         });
// //         //Handle button tap
// //       },
// //   ),











// // Scaffold(
// //       bottomNavigationBar: NavigationBar(
// //       backgroundColor: iconcolor,
// //       surfaceTintColor: Colors.white,
// //       selectedIndex: index,
// //       onDestinationSelected: (index)=>setState(() {
// //         this.index=index;
// //       }),
// //       height: 60,
// //       destinations: [
// //         NavigationDestination(
// //           icon:  Icon(Icons.home, size: 30,color: Colors.white,), label: "home",
// //          ),
// //           NavigationDestination(
// //           icon:  Icon(CupertinoIcons.cart, size: 30,color: Colors.white,), label: "home",
// //          ),
// //           NavigationDestination(
// //           icon:  Icon(Icons.monetization_on, size: 30,color: Colors.white,), label: "home",
// //          )
// //          ],),
// //  body:Pages[index],
  
     
// //    );}}

 //Scaffold(
//         backgroundColor: Color(0XFF75B7E1),
//         extendBody: true,
//         body: _child,
//         bottomNavigationBar: FluidNavBar(
//           icons: [
//             FluidNavBarIcon(
//                 iconPath:'assets/home.svg',
//                 backgroundColor: Color(0xFF4285F4),
//                 extras: {'label': "home"}),
//             FluidNavBarIcon(
//                 iconPath: 'assets/bookmark.svg',
//                 backgroundColor: Color(0xFFEC4143),
//                 extras: {'label': "bookmark"}),
//             FluidNavBarIcon(
//                 iconPath: 'assets/partner.svg',
//                 backgroundColor: Color(0xFFFCBA02),
//                 extras: {'label': "partner"}),
//             FluidNavBarIcon(
//                 iconPath: 'assets/phone.svg',
//                 backgroundColor: Color(0xFF34A950),
//                 extras: {'label': "phone"}),
//           ],
//           onChange: _handleNavigationBarChange,
//           style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
//           scaleFactor: 1.5,
//           itemBuilder: (icon, item) => Semantics(
//             label: icon.extras!["label"],
//             child: item,
//           ),
//         ),
      
//     );
//   }

//   void _handleNavigationBarChange(int index) {
//     setState(() {
//       switch (index) {
//         case 0:
//           _child = homepage(language, storeID: '', storeName: '',);
//           break;
//         case 1:
//           _child = cartpage(language);
//           break;
//         case 2:
//           _child = orderStatepage(language);
//           break;
//         case 3:
//           _child = productpage(language, categoryID: '',);
//           break;
//       }
//     });
//   }
