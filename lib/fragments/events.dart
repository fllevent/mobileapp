import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;


var eventNameList = ["iowa state", "mississippi state", "an event"];
var eventLocationList = ["Iowa state university", "2", "3"];

//class Match {}
//  final String MatchID;
//  final String TeamName;
//  final int TeamNumber;
//  final int matchOne;
//  final int matchTwo;
//  final int matchThree;
//
//class Event {
//  final String eventName;
//  final
//}

//void fetchEvents() {
//  var isLoading = false;
//  var events = [];
//
//  _fetchData() async {
//    isLoading = true;
//
//    final response = await http.get("http://fllevent.com:4000/api/v1/event/allevents");
//    if (response.statusCode ==200) {
//      events = (json.decode(response.body) as List)
//          .map(((data) => new ))
//    }
//  }
//}

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (context, position) {
        return Column(

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                      child: Text(
                        eventNameList[position],
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        eventLocationList[position],
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: <Widget>[
//                        Text(
//                          "5m",
//                          style: TextStyle(color: Colors.grey),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: Icon(
//                            Icons.star_border,
//                            size: 35.0,
//                            color: Colors.grey,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
              ],
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
      itemCount: eventNameList.length,
    );
  }

}