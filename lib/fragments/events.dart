import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:fllevent/model/events_model.dart';

Future<EventsPostList> fetchPost() async {
  final response =
  await http.get('http://fllevent.com:4000/api/v1/team/allteams');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return EventsPostList.fromJson(jsonDecode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EventsPostList>(
      future: fetchPost(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return new ListView.builder(
      itemCount: (1),
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
                      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                      child: Text(
                        snapshot.data.eventsPost[position].eventName,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
//                      child: Text(
//                        snapshot.data.eventsPost[position].toString(),
//                        style: TextStyle(fontSize: 18.0),
//                      ),
//                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        snapshot.data.eventsPost.length.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.star_border,
                          size: 35.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
    );
  }
}