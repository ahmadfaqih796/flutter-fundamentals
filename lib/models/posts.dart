class Posts {
  int id;
  String title;
  String body;

  Posts({required this.id, required this.title, required this.body});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(id: json['id'], title: json['title'], body: json['body']);
  }
}
