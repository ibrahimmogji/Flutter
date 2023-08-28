import 'package:flutter/material.dart';
import 'package:gpay/qrscanner.dart';

class MyApp2 extends StatefulWidget {
  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  void _navigateToMainScreen() {
    // Simulate a delay to show the splash screen for a few seconds.
    Future.delayed(Duration(seconds: 4), () {
      // Replace 'MainScreen()' with your main screen widget.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Gpay()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'lib/icons/gpay.png', // Replace with your logo image path
              width: 150,
              height: 150,
            ),
            SizedBox(height: 70),
            Text(
              'Google Pay',
              style: TextStyle(
                fontFamily: 'Google',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Customize as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*figd_DK27Wpl0ZKYft_q-pVdUK7bbWoxQul63mtpHp4Cb */

class Gpay extends StatefulWidget {
  const Gpay({super.key});
  @override
  State<Gpay> createState() => _GpayState();
}

final TextEditingController _textEditingController = TextEditingController();

final Map<int, String> iconTexts = {
  1: 'Scan any QR code',
  2: 'Pay contacts',
  3: 'Pay phone number',
  4: 'Bank transfer',
  5: 'Pay UPI ID or number',
  6: 'Self transfer',
  7: 'Pay bills',
  8: 'Recharge',
};

var images = [
  '5Y.png',
  'Fp.png',
  'Ld.png',
  '5Y.png',
  'Fp.png',
  'Ld.png',
  '__.png',
  '5Y.png',
];

class _GpayState extends State<Gpay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Positioned(
                    top: 9,
                    left: 10.0,
                    right: 70.0,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .76,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextField(
                        controller: _textEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Pay friends and merchants',
                          hintStyle: TextStyle(
                              fontFamily: "Google", color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 20,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 0, 172, 6),
                      child: Center(
                        child: Text(
                          'I',
                          style: TextStyle(
                              fontFamily: "Google",
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 59,
                      left: 0,
                      right: 0,
                      child: Image(image: AssetImage('lib/icons/backgpay.jpg')))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 260,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  padding: EdgeInsets.all(16.0),
                  children: List.generate(
                    iconTexts.length,
                    (index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (index == 0)
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => QRViewExample()));
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.grey[900],
                                    radius: 20,
                                    child: Image(
                                        image: AssetImage(
                                            'lib/icons/${images[index]}'))),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.grey[900],
                                radius: 20,
                                child: Image(
                                    image: AssetImage(
                                        'lib/icons/${images[index]}'))),
                        SizedBox(height: 8.0),
                        FittedBox(
                          child: Text(
                            iconTexts[index + 1]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Google",
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                          child: Text(
                        'UPI ID:ibrahimmogji21@okaxis',
                        style: TextStyle(
                          fontFamily: "Google",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      )),
                      Icon(
                        Icons.copy,
                        size: 14,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      "People",
                      style: TextStyle(
                          fontFamily: "Google",
                          color: Colors.white,
                          fontSize: 30),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Circle_avtar('Ibrahim', Colors.green),
                      Circle_avtar('Kalpesh', Colors.purple),
                      Circle_avtar('Imran', Colors.orange),
                      Circle_avtar('Nitin', Colors.blue),
                      SizedBox(
                        width: 21,
                      ),
                    ]),
              ),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Circle_avtar('Ibrahim', Colors.blue),
                      Circle_avtar('Kalpesh', Colors.brown),
                      Circle_avtar('Imran', Colors.green),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, top: 10, left: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey[600],
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 7,
                            ),
                            Text('more',
                                style: TextStyle(
                                    fontFamily: "Google",
                                    fontSize: 15,
                                    color: Colors.white))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 21,
                      ),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Businesses",
                        style: TextStyle(
                            fontFamily: "Google",
                            fontSize: 30,
                            color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.shopping_bag),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text('Explore',
                                style: TextStyle(
                                    fontFamily: "Google",
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Circle_avtar('Ibrahim', Colors.blue),
                      Circle_avtar('Kalpesh', Colors.brown),
                      Circle_avtar('Imran', Colors.green),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, top: 10, left: 10),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey[600],
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              height: 7,
                            ),
                            Text('more',
                                style: TextStyle(
                                    fontFamily: "Google",
                                    fontSize: 15,
                                    color: Colors.white))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 21,
                      ),
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Bills,Recharges and More",
                    style: TextStyle(
                        fontFamily: "Google",
                        fontSize: 20,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 1.7,
                  ),
                  Circle_avtar("Google Play", Colors.blue),
                  Circle_avtar("DTH", Colors.blue),
                  Circle_avtar("Electricity", Colors.blue),
                  Circle_avtar("Mobile", Colors.blue),
                  SizedBox(
                    width: 2,
                  ),
                ],
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                      child: Text(
                        "see all",
                        style: TextStyle(
                            fontFamily: "Google",
                            fontSize: 15,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Promotions",
                    style: TextStyle(
                        fontFamily: "Google",
                        fontSize: 25,
                        color: Colors.white),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Circle_avtar("Reward", Colors.blue),
                  Circle_avtar("Offers", Colors.blue),
                  Circle_avtar("IndiHome", Colors.blue),
                  Circle_avtar("Referrals", Colors.blue),
                  SizedBox(
                    width: 1,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.settings_backup_restore_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Check your cibil score for free',
                        style: TextStyle(
                            fontFamily: "Google",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.history,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Show Transaction History',
                        style: TextStyle(
                            fontFamily: "Google",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Check Bank Balance',
                        style: TextStyle(
                            fontFamily: "Google",
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 250,
                color: Colors.grey[800],
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Invite Freinds and get 110rs",
                              style: TextStyle(
                                  fontFamily: "Google",
                                  fontSize: 15,
                                  color: Colors.grey[300])),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                              "Invite Freinds to google pay and get 110rs and your \nfriend does his first payment he gets 21rs",
                              style: TextStyle(
                                  fontFamily: "Google",
                                  fontSize: 15,
                                  color: Colors.grey[500])),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Copy your Code 453rs324',
                              style: TextStyle(
                                  fontFamily: "Google",
                                  fontSize: 15,
                                  color: Colors.grey[500])),
                        ),
                        Icon(
                          Icons.copy,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.blue, width: 2)),
                          child: Center(
                            child: Text("Invite",
                                style: TextStyle(
                                    fontFamily: "Google",
                                    fontSize: 15,
                                    color: Colors.grey[100])),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    child: Text(
                        "Showing businesses based on your location - Learn more",
                        style: TextStyle(
                            fontFamily: "Google",
                            fontSize: 15,
                            color: Colors.grey[100])),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Circle_avtar extends StatelessWidget {
  final String txt;
  final Color color; // Add type annotation for the constructor parameter

  Circle_avtar(this.txt, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 10, left: 10),
      child: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: Center(
                  child: Text(
                txt[0],
                style: TextStyle(
                    fontFamily: "Google", fontSize: 20, color: Colors.white),
              )),
            ),
            SizedBox(
              height: 7,
            ),
            Text(txt,
                style: TextStyle(
                    fontFamily: "Google", fontSize: 15, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
