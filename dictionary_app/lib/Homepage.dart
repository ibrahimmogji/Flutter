import 'package:dictionary_app/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class First extends StatefulWidget {
  const First({super.key});
  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List search = ['different', 'hello', 'sound', 'greet', 'scripture'];
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Dictionary",
              style: TextStyle(
                fontFamily: 'dict',
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Material(
              color: Colors.grey[300],
              elevation: 5.0,
              shadowColor: Colors.red.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                controller: controller,
                onSubmitted: (val) {
                  val != ''
                      ? (Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => DictionaryWidget(
                                data: val,
                              ))))
                      : null;
                  controller.clear();
                },
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Search here!',
                  hintStyle: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
            ),
            child: Text(
              "Recents",
              style: TextStyle(
                fontFamily: 'dict',
                fontSize: 30,
              ),
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      (
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DictionaryWidget(
                              data: search[index],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 14, top: 8.0, bottom: 8),
                      child: Container(
                        child: Text(
                          search[index],
                          style: GoogleFonts.dmSans(fontSize: 20),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
