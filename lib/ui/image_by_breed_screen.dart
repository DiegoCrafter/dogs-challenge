import 'package:dogschallenge/models/image_breed.dart';
import 'package:dogschallenge/provider/all_breeds_provider.dart';
import 'package:flutter/material.dart';

class ImageByBreedScreen extends StatefulWidget {
  final String? breed;
  const ImageByBreedScreen({ Key? key, this.breed }) : super(key: key);

  @override
  _ImageByBreedScreenState createState() => _ImageByBreedScreenState();
}

class _ImageByBreedScreenState extends State<ImageByBreedScreen> {

  AllBreedsProvider _allBreedsProvider = AllBreedsProvider();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breed!),
      ),
      body: FutureBuilder(
        future: _allBreedsProvider.fetchImages(widget.breed!),
        builder: (context, AsyncSnapshot<ImageBreedModel> snapshot){
          if(snapshot.hasData){
            return Image.network(snapshot.data!.message!);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}