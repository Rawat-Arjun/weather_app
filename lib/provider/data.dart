import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataProvider extends ChangeNotifier {
  List cities = [];
  List newList = [];

  Map map = {
    "name": "Delhi",
    "aqi": "401",
    "temperature": 11,
    "wind_speed": 5,
    "humidity": 70,
    "visibility": 0.3,
    "sun": {"sunrise": "7:13 AM", "sunset": "5:54 PM"}
  };

  getData(Map cityData) {
    map = cityData;

    notifyListeners();
  }

  buildList({String searchText = ''}) {
    for (int i = 0; i < cities.length; i++) {
      if (cities[i]['name'].toString().toLowerCase().startsWith(searchText)) {
        newList.add(cities[i]);
      }
    }

    notifyListeners();
  }

  Future<void> fetchData() async {
    final String response = await rootBundle.loadString('assets/weather.json');
    final data = jsonDecode(response);

    cities = data['cities'];

    notifyListeners();
  }

  testFieldOnTap() {
    newList = cities;

    notifyListeners();
  }
}
