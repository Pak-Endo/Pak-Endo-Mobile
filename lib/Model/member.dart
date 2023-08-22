class MemberModel {
  final String memberID;

  MemberModel({required this.memberID});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(memberID: json['memberID']);
  }
}

