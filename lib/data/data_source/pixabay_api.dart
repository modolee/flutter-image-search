import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '19985993-48b647e7133c481248d5bd442';
  http.Client? client;

  PixabayApi({Key? key, this.client}) {
    client ??= http.Client();
  }

  Future<Iterable> fetch(String query) async {
    final response = await client!
        .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonReponse = jsonDecode(response.body);
    Iterable hits = jsonReponse['hits'];
    return hits;
  }
}
