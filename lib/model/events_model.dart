class EventsPostList {
  final List<EventsPost> eventsPost;

  EventsPostList({
    this.eventsPost
  });

  factory EventsPostList.fromJson(List<dynamic> parsedJson) {

    List<EventsPost> eventsPost = new List<EventsPost>();
    eventsPost = parsedJson.map((i)=> EventsPost.fromJson(i)).toList();
    return new EventsPostList(
        eventsPost: eventsPost
    );
  }
}

class EventsPost {
  final int eventID;
  final String eventName;
  final int eventOwner;

  EventsPost({
    this.eventID,
    this.eventName,
    this.eventOwner,
  });

  factory EventsPost.fromJson(Map<String, dynamic> json) {
    return new EventsPost(
        eventID: json['EventID'],
        eventName: json['EventName'],
        eventOwner: json['Owner'],
        );
  }
}