import 'package:flutter/material.dart';
import 'package:smartgarden/Constants/colors.dart';
import 'package:smartgarden/Pages/Mainpage/mainpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: GREEN_COLOR,
        onPressed: () {
          _navigation(context);
        },
        child: Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                _subtitle(),
              ],
            ),
          ),
          _image(),
        ],
      ),
    );
  }
}

Text _title() {
  return Text(
    "Bem vindo ao",
    style: TextStyle(
        color: Colors.white60, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

Text _subtitle() {
  return Text(
    "SmartGarden",
    style: TextStyle(
        color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
  );
}

Widget _image() {
  return Image(
    image: AssetImage('assets/boy.png'),
  );
}

_navigation(BuildContext context) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => MainPage()));
}
