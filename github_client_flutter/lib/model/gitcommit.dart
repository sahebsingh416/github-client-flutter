class GitCommit {
  Commit commit;
  CommitterDetails committer;

  GitCommit({this.commit, this.committer});

  GitCommit.fromJson(Map<String, dynamic> json) {
    commit =
        json['commit'] != null ? new Commit.fromJson(json['commit']) : null;
    committer = json['committer'] != null
        ? new CommitterDetails.fromJson(json['committer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commit != null) {
      data['commit'] = this.commit.toJson();
    }
    if (this.committer != null) {
      data['committer'] = this.committer.toJson();
    }
    return data;
  }
}

class Commit {
  Committer committer;
  String message;

  Commit({this.committer, this.message});

  Commit.fromJson(Map<String, dynamic> json) {
    committer = json['committer'] != null
        ? new Committer.fromJson(json['committer'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.committer != null) {
      data['committer'] = this.committer.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Committer {
  String name;
  String email;
  String date;

  Committer({this.name, this.email, this.date});

  Committer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['date'] = this.date;
    return data;
  }
}

class CommitterDetails {
  String login;
  int id;
  String avatarUrl;
  String url;

  CommitterDetails({this.login, this.id, this.avatarUrl, this.url});

  CommitterDetails.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatarUrl;
    data['url'] = this.url;
    return data;
  }
}