import 'dart:ffi';

import 'package:http/http.dart';
import 'dart:convert';

class CountryData {

  Map data;

  Future<Void> getCountry() async{
    try {
      Response response = await get('https://covid.ourworldindata.org/data/owid-covid-data.json');
      data = jsonDecode(response.body);
    }
    catch(e){
      print('error caught $e');
    }
  }
}