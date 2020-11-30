class User {
  String name;
  String username;
  String email;
  String phone;
  String country;
  String type;
  String updatedAt;
  String createdAt;
  int id;

  User(
      {this.name,
      this.username,
      this.email,
      this.phone,
      this.country,
      this.type,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
