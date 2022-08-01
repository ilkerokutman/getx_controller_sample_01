import 'dart:developer';

import 'package:dio/dio.dart';

class AppNetwork {
  static String url = "https://api-football-standings.azharimm.site/leagues";

  static Future<List<dynamic>> getLeagueList() async {
    List<dynamic> myList = <dynamic>[];

    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        if (response.data != null) {
          if (response.data['data'].isNotEmpty) {
            log('list fetched from api');
            myList = response.data['data'];
          }
        }
      }
    } catch (exception) {
      log(exception.toString());
      return myList;
    }

    return myList;
  }
}
