class MemberModel {
  final String memberID;
  final String password;

  MemberModel({
    required this.memberID,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'memberID': memberID,
      'password': password,
    };
  }
}


