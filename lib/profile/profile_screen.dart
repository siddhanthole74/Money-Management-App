
import 'package:flutter/material.dart';


import '../widgets/bottomnavigationbar.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Bottom())),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Profile"),

      ),

      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}


