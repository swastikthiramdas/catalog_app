import 'package:flutter/material.dart';
import 'package:flutter_first_project/pages/cart_page.dart';
import 'package:flutter_first_project/utils/myraouts.dart';
import 'package:flutter_first_project/widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRaouts.homeraouts,
      routes: {
        "/" : (context) => LoginPage(),
        MyRaouts.homeraouts : (context) => HomePage(),
        MyRaouts.loginraouts : (context) => LoginPage(),
        MyRaouts.cartraouts : (context) => CartPage(),
      },
    );
  }
}




