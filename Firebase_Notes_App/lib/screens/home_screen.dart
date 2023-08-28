import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../style/app_style.dart';
import '../widgets/note_card.dart';
import 'note_editor.dart';
import 'note_reader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Text(
                "My Notes",
                style: GoogleFonts.aladin(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 90,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("Notes").orderBy("creation_date", descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        return GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          children: snapshot.data!.docs
                              .map((note) => noteCard(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NoteReaderScreen(note),
                                        ));
                                  }, note))
                              .toList(),
                        );
                      }

                      if (snapshot.hasData) {
                        var notes = snapshot.data!.docs;
                        if (notes.isEmpty) {
                          return Center(
                            child: Text(
                              "No notes available",
                              style: GoogleFonts.nunito(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          );
                        }
                      }
                         return Center(
                        child: Text(
                          "No notes available",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      );
                      
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteEditorScreen()));
        },
        child: Icon(Icons.add,size: 40,),
        
      ),
     
    );
  }
}
