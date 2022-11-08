import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUri =
        "https://imgs.search.brave.com/MTI0GmdD7i4R2FX8bPx0nqjwC6vH1mdGOjFL9116T5Y/rs:fit:1200:798:1/g:ce/aHR0cHM6Ly9zbS5h/c2ttZW4uY29tL3Qv/YXNrbWVuX2luL2Fy/dGljbGUvZi9mYWNl/Ym9vay1wL2ZhY2Vi/b29rLXByb2ZpbGUt/cGljdHVyZS1hZmZl/Y3RzLWNoYW5jZXMt/b2YtZ2V0dGluX2Zy/M24uMTIwMC5qcGc";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Swastik Thiramdas"),
                accountEmail: Text("swastikbthiramdas@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUri),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading:
                  Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text("Profile",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading:
              Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text("Email Me",
                  textScaleFactor: 1.2, style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
