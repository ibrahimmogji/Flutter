import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});
  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  List RandomImages = [
    'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
    'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
    'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
    'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528'
  ];
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25, top: 10),
                  child: Container(
                    height: Size.height * .4,
                    width: Size.width * .9,
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
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sea Of Peace',
                              style: TextStyle(
                                fontFamily: 'Gelion',
                                fontSize: 25,
                              )),
                          Row(
                            children: [
                              Text(
                                'Portic Team',
                                style: TextStyle(
                                    fontFamily: 'Gelion',
                                    fontSize: 15,
                                    color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('8Km',
                                  style: TextStyle(
                                      fontFamily: 'Gelion',
                                      fontSize: 15,
                                      color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.message),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text('4.5',
                                    style: TextStyle(
                                        fontFamily: 'Gelion', fontSize: 15)),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 30,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('2d:12h:56m',
                              style: TextStyle(
                                  fontFamily: 'Gelion',
                                  fontSize: 20,
                                  color: Colors.blue)),
                          Text('Starts in...',
                              style:
                                  TextStyle(fontFamily: 'Gelion', fontSize: 15,
                                  color: Colors.grey)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 30),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < RandomImages.length; i++)
                                  Align(
                                    widthFactor: 0.5,
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundImage:
                                          NetworkImage(RandomImages[i]),
                                    ),
                                  ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "63+",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 27),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      width: 70.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/images/map.jpg"),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                          child: Text(
                        "Join this Tour!",
                        style: TextStyle(fontSize: 30, color: Colors.white,fontFamily: 'Gelion'),
                      )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
