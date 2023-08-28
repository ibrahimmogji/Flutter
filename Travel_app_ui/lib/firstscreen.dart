import 'package:flutter/material.dart';

import 'components/TravelContainer.dart';
import 'components/bottomContainer.dart';
import 'components/containerpart.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'lastscreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: GNav(
            backgroundColor: Colors.grey[300]!,
            color: Colors.black,
            padding: EdgeInsets.all(16),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: 'Favourite',
              ),
              GButton(
                icon: Icons.person_outlined,
                text: 'Profile',
              ),
            ]),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text("Welcome! Amirali",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontFamily: "Gelion")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on),
                              Text("Sanfransisco , USA",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "Gelion")),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                print(Size.height);
                              },
                              icon: Icon(Icons.notifications)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: Size.height * 0.07,
                    width: Size.width * 0.86,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(80)),
                    child: TextField(
                        decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.search, size: 40, color: Colors.black),
                      border: InputBorder.none,
                      hintText: 'Search Destination',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Gelion"),
                      suffixIcon: IconButton(
                        onPressed: () {
                          print("icon pressed");
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                    ))),
                GestureDetector(onTap: () {}, child: Containerr()),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LastScreen()),
                      );
                    },
                    child: TravelContainer()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Group Tours",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontFamily: "Gelion"),
                      ),
                    ),
                  ],
                ),
                BottomContainer()
              ],
            ),
          ),
        ));
  }
}
