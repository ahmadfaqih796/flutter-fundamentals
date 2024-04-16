class ResponseUser {
  int? id;
  String? email;
  String? fullname;
  String? updatedAt;
  String? createdAt;

  ResponseUser(
      {this.id, this.email, this.fullname, this.updatedAt, this.createdAt});

  ResponseUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}
