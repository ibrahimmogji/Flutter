import 'package:flutter/material.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({super.key});
  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.24,
      width: size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTravelCard(size),
          _buildTravelCard(size),
          _buildTravelCard(size),
        ],
      ),
    );
  }
}
List RandomImages = [
  'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
  'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
  'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
  'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528'
];

Widget _buildTravelCard(Size size) {
  return Container(
    height: size.height * 0.7,
    width: size.width * 0.89,
    margin: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(40),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:10.0,top:10.0,bottom:10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 180,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/images/travel.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0,left: 13),
                  child: Text("Sea of Peace",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontFamily: 'Gelion')),
                )
              ],
            ),Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:13.0),
                  child: Text("Portic Team",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontFamily: 'Gelion')),
                )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.circle,size: 14,),
                  Text('Alabama',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontFamily: 'Gelion')),
                  Text("------"),
                  Icon(
                    Icons.location_on,
                    size: 14,
                  ),
                  Text("Alaska",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontFamily: 'Gelion'))
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 30,left: 20),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < RandomImages.length; i++)
                        Align(
                          widthFactor: 0.5,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage(RandomImages[i]),
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
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            width: 70.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20)),
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
        )
      ],
    ),
  );
}
