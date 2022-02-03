import 'dart:convert';

import 'package:dogschallenge/models/breeds_model.dart';
import 'package:dogschallenge/models/image_breed.dart';
import 'package:http/http.dart' as http;

class AllBreedsProvider {
  Future<BreedsModel> fetchBreeds() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if(response.statusCode == 200){
      return breedsModelFromJson(response.body);
    }else{
      throw Exception('Failed to load all breeds');
    }
  }

  Future<ImageBreedModel> fetchImages(String breed) async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breed/${breed}/images/random'));
    if(response.statusCode == 200){
      return imageBreedModelFromJson(response.body);
    }else{
      throw Exception('Failed to load random images');
    }
  }
}