import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'afe3b088648519f7ebbc0b79f56e70e3';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-US';

  MoviesProvider() {
    print('MoviesProvider inicializado');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(response.body);

    print(decodedData['results']);
  }
}
