import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/photo.dart';

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '19985993-48b647e7133c481248d5bd442';

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo',
      ),
    );

    Map<String, dynamic> jsonReponse = jsonDecode(response.body);
    Iterable hits = jsonReponse['hits'];
    return hits.map((hit) => Photo.fromJson(hit)).toList();
  }
}
