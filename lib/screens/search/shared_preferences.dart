// For Jason Data Store in Shared Preferences
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final rawData = <String, dynamic>{};

final defaultData = <String, dynamic>{
  'value1': 'not found.',
  'value2': '',
};

class SharedPerference {
  Future saveJsonData(jsonData) async {
    final prefs = await SharedPreferences.getInstance();

    debugPrint('Raw data: $rawData');

    rawData.addEntries(jsonData.entries);
    debugPrint('Raw data: $rawData');

    var saveData = jsonEncode(rawData);
    await prefs.setString('jsonData', saveData);
  }

  Future<void> getJsonData() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('jsonData') ?? jsonEncode(defaultData);
    debugPrint('Data received: $temp');
    /* var data = HomePageModel.fromMap(jsonDecode(temp.toString()));
    debugPrint('value1: ${(data.value1.toString())}');
    debugPrint('value2: ${(data.va;lue2.toString())}'); */
  }
}
