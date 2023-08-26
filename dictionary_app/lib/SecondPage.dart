import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DictionaryWidget extends StatefulWidget {
  String? data;
  DictionaryWidget({super.key, required this.data});

  @override
  _DictionaryWidgetState createState() => _DictionaryWidgetState();
}

class _DictionaryWidgetState extends State<DictionaryWidget> {
  String jsonData = ""; // Store fetched JSON data here
  List<dynamic> meanings = [];
  bool isFetchingData = true;

  String phoneticstext = "";

  get data => widget.data;

  // Store the meanings data here

  @override
  void initState() {
    fetchData(data);
    super.initState();
  }

  Future<void> fetchData(String word) async {
    setState(() {
      isFetchingData = true; // Show progress indicator
    });
    final response = await http.get(
      Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$data'),
    );

    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      final firstEntry = parsedJson[0] as Map<String, dynamic>;
      //final word = firstEntry['word'] as String;
      final meanings = firstEntry['meanings'] as List<dynamic>;

      final phonetics = firstEntry['phonetics'] as List<dynamic>;
      final List phoneticTexts = phonetics
          .where((phonetic) =>
              phonetic.containsKey("text") && phonetic["text"].isNotEmpty)
          .map((phonetic) => phonetic["text"])
          .toList();
      phoneticstext = phoneticTexts.join(', ');

      setState(() {
        jsonData = response.body;
        this.meanings = meanings;
        isFetchingData = false;
        // print(firstEntry['phonetics'][0]['text']);
        /// print(phoneticstext);
      });
    } else {
      // Handle error
      setState(() {
        jsonData = "Failed to fetch data";
        isFetchingData = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Text(
                  data,
                  style: GoogleFonts.dmSans(fontSize: 60),
                )),
            if (isFetchingData) Center(child: CircularProgressIndicator()),
            if (!isFetchingData)
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      phoneticstext,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.play_arrow)))
                ],
              ),
            SizedBox(height: 20),
            if (meanings.isNotEmpty)
              for (var meaning in meanings) ...[
                for (var i = 0;
                    i < (meaning['definitions'] as List).length && i < 3;
                    i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Definition ${i + 1}: ${meaning['definitions'][i]['definition']}',
                            style: GoogleFonts.dmSans(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                        if (meaning['definitions'][i].containsKey('synonyms') &&
                            (meaning['definitions'][i]['synonyms'] as List)
                                .isNotEmpty)
                          Text(
                              'Synonyms: ${meaning['definitions'][i]['synonyms'].join(',')}',
                              style: GoogleFonts.dmSans(fontSize: 20)),
                        if (meaning['definitions'][i].containsKey('antonyms') &&
                            (meaning['definitions'][i]['antonyms'] as List)
                                .isNotEmpty)
                          Row(
                            children: [
                              Text('Antonyms:',
                                  style: GoogleFonts.dmSans(fontSize: 20)),
                              Text(
                                  '${meaning['definitions'][i]['antonyms'].join(', ')}',
                                  style: GoogleFonts.dmSans(fontSize: 20)),
                            ],
                          ),
                        if (meaning['definitions'][i].containsKey('example'))
                          Text(
                            'Example: ${meaning['definitions'][i]['example']}',
                            style: GoogleFonts.dmSans(fontSize: 20),
                            softWrap: true,
                          ),

                        Divider(), // Add a divider between definitions
                      ],
                    ),
                  ),
                if (meaning.containsKey('antonyms') &&
                    (meaning['antonyms'] as List).isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Antonyms: ${meaning['antonyms'].join(', ')}',
                        style: GoogleFonts.dmSans(fontSize: 20)),
                  ),
                SizedBox(height: 20),
              ],
          ],
        ),
      ),
    );
  }
}
