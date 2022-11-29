class Nba {
  List<Data>? data;
  Meta? meta;

  Nba({this.data, this.meta});

  Nba.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? date;
  HomeTeam? homeTeam;
  int? homeTeamScore;
  int? period;
  bool? postseason;
  int? season;
  String? status;
  String? time;
  HomeTeam? visitorTeam;
  int? visitorTeamScore;

  Data(
      {this.id,
      this.date,
      this.homeTeam,
      this.homeTeamScore,
      this.period,
      this.postseason,
      this.season,
      this.status,
      this.time,
      this.visitorTeam,
      this.visitorTeamScore});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    homeTeam = json['home_team'] != null
        ? new HomeTeam.fromJson(json['home_team'])
        : null;
    homeTeamScore = json['home_team_score'];
    period = json['period'];
    postseason = json['postseason'];
    season = json['season'];
    status = json['status'];
    time = json['time'];
    visitorTeam = json['visitor_team'] != null
        ? new HomeTeam.fromJson(json['visitor_team'])
        : null;
    visitorTeamScore = json['visitor_team_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    if (this.homeTeam != null) {
      data['home_team'] = this.homeTeam!.toJson();
    }
    data['home_team_score'] = this.homeTeamScore;
    data['period'] = this.period;
    data['postseason'] = this.postseason;
    data['season'] = this.season;
    data['status'] = this.status;
    data['time'] = this.time;
    if (this.visitorTeam != null) {
      data['visitor_team'] = this.visitorTeam!.toJson();
    }
    data['visitor_team_score'] = this.visitorTeamScore;
    return data;
  }
}

class HomeTeam {
  int? id;
  String? abbreviation;
  String? city;
  String? conference;
  String? division;
  String? fullName;
  String? name;

  HomeTeam(
      {this.id,
      this.abbreviation,
      this.city,
      this.conference,
      this.division,
      this.fullName,
      this.name});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    abbreviation = json['abbreviation'];
    city = json['city'];
    conference = json['conference'];
    division = json['division'];
    fullName = json['full_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['abbreviation'] = this.abbreviation;
    data['city'] = this.city;
    data['conference'] = this.conference;
    data['division'] = this.division;
    data['full_name'] = this.fullName;
    data['name'] = this.name;
    return data;
  }
}

class Meta {
  int? totalPages;
  int? currentPage;
  int? nextPage;
  int? perPage;
  int? totalCount;

  Meta(
      {this.totalPages,
      this.currentPage,
      this.nextPage,
      this.perPage,
      this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    nextPage = json['next_page'];
    perPage = json['per_page'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    data['next_page'] = this.nextPage;
    data['per_page'] = this.perPage;
    data['total_count'] = this.totalCount;
    return data;
  }
}
