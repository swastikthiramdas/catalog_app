import 'package:flutter/material.dart';

class GlobalSnackBar{
  final String msg;

  const GlobalSnackBar({required this.msg});


  static show(
      BuildContext context,
      String msg,
      ){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg) , duration: Duration(seconds: 2),)
    );
  }
}