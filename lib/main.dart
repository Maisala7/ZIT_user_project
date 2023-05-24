import 'package:flutter/material.dart';
import 'package:flutter_application_7/app_screens/welcom_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      //textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
      ),
       home:welcomPage(),
     );
  }
}

