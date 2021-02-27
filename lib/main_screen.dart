import 'package:flutter/material.dart';
import 'package:corona_monitor_flutter/country.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Map passedData;
  List<Country> countryList = [];
  String query = '';


  @override
  Widget build(BuildContext context) {

    passedData = ModalRoute.of(context).settings.arguments;
    countryList = passedData['list'];

    countryList = countryList.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body:
      Column(

        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)
              ),
              color: Colors.white,
            ),
            child:
            TextField(
//              controller: myController,
              style: TextStyle(
                fontSize: 20.0,
              ),


              onChanged: (text){
                setState(() {
                  query = text;
                });
              },


              decoration: InputDecoration(
                hintText: 'Search for a country',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  iconSize: 30.0,

                ),
              ),

              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.bottom,
              onEditingComplete: () {},
            ),
          ),

          Expanded( //listView won't show if it is not wrapped in a expanded widget
            child: ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (context, index){


                return Padding(
                  padding: EdgeInsets.all(10.0),
                    child: Card(
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Column(

                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,

                             children: [
                               Text(
                                 countryList[index].name,
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20.0,
                                 ),
                               ),
                               SizedBox(height: 20.0),
                               Text('Date: ${countryList[index].date}',
                               ),
                               SizedBox(height: 20.0),
                               Text('New cases: ${countryList[index].cases}',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                               ),
                             ],
                           ),
                           CircleAvatar(
                             backgroundColor: Colors.black,
                             radius: 33.0,
                             child: CircleAvatar(
                               backgroundImage: AssetImage('assets/image.webp'),
                               radius: 30.0,
                             ),
                           ),
                         ],
                       ),
                     ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}