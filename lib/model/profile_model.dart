class ProfileModel {
  String? email;
  String? phoneNumber;
  String? fullName;
  String? memberID;
  String? gender;
  String? city;
  String? type;
  int? status;
  String? role;
  String? id;

  String? firstName;
  String? lastName;
  String? prefix;
  String? password;

  ProfileModel(
      {this.email,
      this.phoneNumber,
      this.fullName,
      this.memberID,
      this.gender,
      this.city,
      this.type,
      this.status,
      this.role,
      this.id,
      this.firstName,
      this.lastName,
      this.password,
      this.prefix});

  ProfileModel.fromJson(dynamic json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    fullName = json['fullName'];
    memberID = json['memberID'];
    gender = json['gender'];
    city = json['city'];
    type = json['type'];
    status = json['status'];
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['gender'] = gender;
    map['city'] = city;
    map['prefix'] = prefix;
    map['password'] = password;
    return map;
  }

}