import 'package:flutter/material.dart';

class TravelContainer extends StatelessWidget {
  const TravelContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.36,
      width: size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTravelCard(size, "lib/images/redfort.jpg", 'Red Fort', 'India'),
          _buildTravelCard(
              size, "lib/images/travel.jpg", 'Lunan Beach', 'Australia'),
          _buildTravelCard(
              size, "lib/images/tajmahal.jpg", 'Taj Mahal', 'India'),
          _buildTravelCard(size, "lib/images/redfort.jpg", 'Red Fort', 'India'),
          _buildTravelCard(
              size, "lib/images/travel.jpg", 'Lunan Beach', 'Australia'),
          _buildTravelCard(
              size, "lib/images/tajmahal.jpg", 'Taj Mahal', 'India'),
        ],
      ),
    );
  }

  Widget _buildTravelCard(Size size, image, txt, String country) {
    return Container(
      height: size.height * 0.7,
      width: size.width * 0.58,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  txt,
                  style: TextStyle(
                    fontFamily: 'Gelion',
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Text(
                  '4.5',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontFamily: 'Gelion',
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 13),
                Text(
                  country,
                  style: TextStyle(fontSize: 14, fontFamily: 'Gelion'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₹3500/",
                  style: TextStyle(
                      color: Colors.blue, fontSize: 14, fontFamily: 'Gelion'),
                ),
                Text(
                  "Person",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontFamily: 'Gelion'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
