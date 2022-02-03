import 'package:dogschallenge/models/breeds_model.dart';
import 'package:dogschallenge/provider/all_breeds_provider.dart';
import 'package:flutter/material.dart';

import 'image_by_breed_screen.dart';

class BreedByWordScreen extends StatefulWidget {
  final String? word;
  const BreedByWordScreen({Key? key, this.word}) : super(key: key);

  @override
  _BreedByWordScreenState createState() => _BreedByWordScreenState();
}

class _BreedByWordScreenState extends State<BreedByWordScreen> {
  AllBreedsProvider allBreedsProvider = AllBreedsProvider();

  List<String> breeds = [];

  @override
  void initState() {
    fetchApi();
    super.initState();
  }

  fetchApi() async {
    await allBreedsProvider.fetchBreeds().then((value) {
      value.message!.entries.forEach((element) {
        breeds.add(element.key);
      });
    });
    
    breeds = breeds.where((element) => element.toLowerCase().startsWith(widget.word!.toLowerCase())).toList();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.word!),
        ),
        body: breeds.isNotEmpty
            ? ListView.builder(
                itemCount: breeds.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(breeds[index]),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ImageByBreedScreen(
                        breed: breeds[index],
                      )));
                    },
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
