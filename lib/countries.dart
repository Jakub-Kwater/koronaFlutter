import 'package:corona_monitor_flutter/country.dart';

class Countries{
  String countryName;
  String newCases;
  String latestDate;
  List countryIdList;
  Map data;
  List<Country> listOfCountries = [];

  Countries(this.data);

  List<Country> countriesToList(){
    countryIdList = data.entries.map((e) => e.key).toList();

    for(int i=0; i<countryIdList.length; i++){


      Map mapOfDays = data[countryIdList[i]];
      List listOfDays = mapOfDays['data'];

      countryName = data[countryIdList[i]]['location'];
      latestDate = data[countryIdList[i]]['data'][listOfDays.length - 1]['date'].toString();
      newCases = data[countryIdList[i]]['data'][listOfDays.length - 1]['new_cases'].toString();


      listOfCountries.add(Country(name: countryName, date: latestDate, cases: newCases));
    }
    return listOfCountries;
  }

}