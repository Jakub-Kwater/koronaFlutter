import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'country_data.dart';

import 'package:corona_monitor_flutter/countries.dart';
import 'package:corona_monitor_flutter/country.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Countries countries;
  List<Country> countryList = [];


  void setupCountriesData() async{
    CountryData instance = CountryData();
    await instance.getCountry();

    countries = Countries(instance.data);
    countryList = countries.countriesToList();

    Navigator.pushReplacementNamed(context, '/main', arguments: {
      'list': countryList
    });
  }

  @override
  void initState() {
    super.initState();
    setupCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 90.0,
        ),
      ),
    );
  }
}
