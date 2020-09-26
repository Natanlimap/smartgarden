import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smartgarden/Constants/colors.dart';
import 'package:smartgarden/Constants/plants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: BACKGROUND_COLOR,
        child: Icon(Icons.add),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 60),
          _topInfo(),
          SizedBox(height: 30),
          _recentPlants(),
          SizedBox(height: 30),
          _recentServicesWidget()
        ],
      ),
    );
  }
}

ListTile _topInfo() {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      "Bem vindo",
      style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      "Skywalker",
      style: TextStyle(
          color: BACKGROUND_COLOR, fontWeight: FontWeight.bold, fontSize: 24),
    ),
    trailing: Icon(
      Icons.notifications_active,
      color: BACKGROUND_COLOR,
    ),
  );
}

Widget _recentPlants() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Minhas plantas",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      _horizontalSliderOfRecentPlants()
    ],
  );
}

Widget _horizontalSliderOfRecentPlants() {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _plantCardFromHorizontalSlider(RECENT_PLANTS[0]),
      _plantCardFromHorizontalSlider(RECENT_PLANTS[1]),
      _plantCardFromHorizontalSlider(RECENT_PLANTS[2])
    ],
  ));
}

Widget _plantCardFromHorizontalSlider(var plantInfo) {
  print('assets/' + plantInfo["foto"]);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 115,
        height: 150,
        child: Card(
          elevation: 10,
          color: PALLET_COLORS[Random().nextInt(3)],
          child: Image(
            width: 200,
            height: 100,
            image: AssetImage(plantInfo['foto']),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(plantInfo['name'],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            Text(
              "08/05/2020",
              style: TextStyle(color: Colors.black38),
            )
          ],
        ),
      )
    ],
  );
}

Widget _recentServicesWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Serviços recentes",
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      _recentServicesList()
    ],
  );
}

ListView _recentServicesList() {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: PLANT_ALERT.length,
      itemBuilder: (context, index) {
        var alert = PLANT_ALERT[index];
        return Container(
            child: Card(
          color: PALLET_COLORS[index],
          child: ListTile(
            title: Text(
              alert["service"],
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(alert["plant"]), Text(alert['data'])],
            ),
          ),
        ));
      });
}
