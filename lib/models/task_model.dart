class Task {
  String id;
  String text;
  String owner;
  String username;

  Task({this.id, this.text, this.owner, this.username});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    owner = json['owner'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['owner'] = this.owner;
    data['username'] = this.username;
    return data;
  }
}
