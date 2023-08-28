import 'package:flutter/material.dart';

import 'firstscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Size.height * .7,
                width: Size.width * .95,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/images/travel.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text("Travel anywhere in the ",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: "Gelion")),
              ),
              Container(
                child: Text("World Without any Hassle",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontFamily: "Gelion")),
              ),
              Container(
                child: Text(
                    "if you like to travel a lot this is your place! Here",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: "Gelion")),
              ),
              Container(
                child: Text("you can travel a lot",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: "Gelion")),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 38.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(100)),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FirstScreen()),
                                );
                              });
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontFamily: "Gelion",
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(100)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstScreen()),
                              );
                            },
                            child: Text(
                              "Next->",
                              style: TextStyle(
                                  fontFamily: "Gelion",
                                  color: Colors.grey[300],
                                  fontSize: 20),
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
