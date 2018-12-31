class TeamsPostList {
  final List<TeamsPost> teamsPost;

  TeamsPostList({
    this.teamsPost
  });

  factory TeamsPostList.fromJson(List<dynamic> parsedJson) {

    List<TeamsPost> teamsPost = new List<TeamsPost>();
    teamsPost = parsedJson.map((i)=> TeamsPost.fromJson(i)).toList();
    return new TeamsPostList(
      teamsPost: teamsPost
    );
  }
}

class TeamsPost {
  final int matchID;
  final String teamName;
  final int teamNumber;
  final String eventName;
  final int matchScoreOne;
  final int matchScoreTwo;
  final int matchScoreThree;
  final int year;

  TeamsPost(
      {this.matchID,
        this.teamName,
        this.teamNumber,
        this.eventName,
        this.matchScoreOne,
        this.matchScoreTwo,
        this.matchScoreThree,
        this.year});

  factory TeamsPost.fromJson(Map<String, dynamic> json) {
    return new TeamsPost(
        matchID: json['MatchID'],
        teamName: json['TeamName'],
        teamNumber: json['TeamNumber'],
        eventName: json['EventName'],
        matchScoreOne: json['MatchScoreOne'],
        matchScoreTwo: json['MatchScoreTwo'],
        matchScoreThree: json['MatchScoreThree'],
        year: json['Year']);
  }
}