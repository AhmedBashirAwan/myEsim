import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  List<String> languages = [
    "English",
    "Spanish",
    "Mandarin Chinese",
    "Hindi",
    "Arabic",
    "Bengali",
    "Portuguese",
    "Russian",
    "Japanese",
    "German",
    "French",
    "Urdu",
    "Swahili",
    "Italian",
    "Dutch"
  ];

  List<String> filteredLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('Languages'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filteredLanguages = languages
                        .where((language) => language
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    filteredLanguages = languages
                        .where((language) => language
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  labelText: 'Search for the language you want',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(languages[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
