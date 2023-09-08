class ProfileModel {
  ProfileModel({
      this.email, 
      this.phoneNumber, 
      this.fullName, 
      this.memberID, 
      this.gender, 
      this.city, 
      this.type, 
      this.status, 
      this.role, 
      this.id,});

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['fullName'] = fullName;
    map['memberID'] = memberID;
    map['gender'] = gender;
    map['city'] = city;
    map['type'] = type;
    map['status'] = status;
    map['role'] = role;
    map['id'] = id;
    return map;
  }

}