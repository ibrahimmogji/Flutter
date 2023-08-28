import 'package:flutter/material.dart';

class Containerr extends StatefulWidget {
  @override
  State<Containerr> createState() => _ContainerrState();
}
class _ContainerrState extends State<Containerr> {
  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Container(
      height: Size.height * 0.08,
      width: Size.width * 1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            height: Size.height * 0.7,
            width: Size.width * .22,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: Text(
                'Lakes',
                style: TextStyle(fontFamily: "Gelion", color: Colors.white),
              ),
            ),
          ),
          Container(
            height: Size.height * 0.7,
            width: Size.width * .22,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Jungle',
                style: TextStyle(fontFamily: "Gelion", color: Colors.white),
              ),
            ),
          ),
          Container(
            height: Size.height * 0.7,
            width: Size.width * .22,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Mountains',
                style: TextStyle(fontFamily: "Gelion", color: Colors.white),
              ),
            ),
          ),
          Container(
            height: Size.height * 0.7,
            width: Size.width * .22,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Beaches',
                style: TextStyle(fontFamily: "Gelion", color: Colors.white),
              ),
            ),
          ),
          Container(
            height: Size.height * 0.7,
            width: Size.width * .22,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Waterparks',
                style: TextStyle(fontFamily: "Gelion",color: Colors.white),
              ),
            ),
          ),
          // Add more Container widgets as needed
        ],
      ),
    );
  }
}
