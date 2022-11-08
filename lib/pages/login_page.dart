import 'package:flutter/material.dart';

import '../utils/myraouts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool change = false;
  final _form_key = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (_form_key.currentState!.validate()) {
      setState(() {
        change = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRaouts.homeraouts);
      setState(() {
        change = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _form_key,
            child: Column(
              children: [
                Image.asset(
                  "assets/img/login_img.png",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "username cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password cannot be empty";
                          } else if (value.length < 6) {
                            return "password must be more than 6 digits";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "password"),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(change ? 50 : 8),
                        child: InkWell(
                          onTap: () => MoveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: change ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: change
                                ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                                : Text("LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
