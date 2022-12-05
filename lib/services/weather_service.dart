import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/data/entities/weather.dart';

class WeatherService {
  Future getReponse(String query) async {
    try {
      final url = Uri(
          scheme: 'http',
          host: 'api.weatherapi.com',
          path: 'v1/current.json',
          queryParameters: {
            "key": "1bc0383d81444b58b1432929200711",
            "q": query
          });
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Weather.fromJson(data['current']);
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
