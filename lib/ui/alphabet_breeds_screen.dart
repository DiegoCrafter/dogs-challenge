import 'package:flutter/material.dart';

import 'breeds_by_word_screen.dart';

class AlphabetBreedScreen extends StatefulWidget {
  const AlphabetBreedScreen({Key? key}) : super(key: key);

  @override
  _AlphabetBreedScreenState createState() => _AlphabetBreedScreenState();
}

class _AlphabetBreedScreenState extends State<AlphabetBreedScreen> {
  @override
  Widget build(BuildContext context) {
    var aCode = 'A'.codeUnitAt(0);
    var zCode = 'Z'.codeUnitAt(0);

    List<String> alphabets = List<String>.generate(
      zCode - aCode + 1,
      (index) => String.fromCharCode(aCode + index),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Bienvenido'),
        ),
        body: ListView.builder(
            itemCount: alphabets.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(alphabets[index]),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BreedByWordScreen(
                        word: alphabets[index],
                      )));
                },
              );
            }));
  }
}
