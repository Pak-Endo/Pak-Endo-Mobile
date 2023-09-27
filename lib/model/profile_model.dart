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

// class EventModel {
//   String? id;
//   String? title;
//   String? description;
//   int? startDate;
//   int? endDate;
//   String? location;
//   Gallery? gallery;
//   bool? deletedCheck;
//   String? eventStatus;
//   List<Agenda>? agenda;
//   String? type;
//   // String? organizer;
//   String? organizerContact;
//   String? featuredImage;
//   bool? isFavourite;
//   bool? isAttended;
//
//   int? fees;
//
//   EventModel({
//     this.id,
//     this.title,
//     this.description,
//     this.startDate,
//     this.endDate,
//     this.location,
//     this.gallery,
//     this.deletedCheck,
//     this.eventStatus,
//     this.agenda,
//     this.type,
//     // this.organizer,
//     this.organizerContact,
//     this.featuredImage,
//     this.fees
//   });
//
//   EventModel.fromJson(dynamic json) {
//     id = json['_id'];
//     title = json['title'];
//     description = json['description'];
//     startDate = json['startDate'];
//     endDate = json['endDate'];
//     location = json['location'];
//     if (json['gallery'] is List) {
//       gallery = Gallery.fromJson((json['gallery'] as List).first);
//     } else {
//       gallery = Gallery.fromJson(json['gallery']);
//     }
//     deletedCheck = json['deletedCheck'];
//     eventStatus = json['eventStatus'];
//     if (json['agenda'] != null) {
//       agenda = [];
//       json['agenda'].forEach((v) {
//         agenda?.add(Agenda.fromJson(v));
//       });
//     }
//     type = json['type'];
//     // organizer = json['organizer']??'';
//     organizerContact = json['organizerContact'];
//     featuredImage = json['featuredImage'];
//     isFavourite = json['isFavorite'];
//     isAttended = json['isAttended'];
//     fees = json['fees'];
//   }
// }
//
// class Gallery {
//   final String id;
//   final String eventID;
//   final List<String> mediaUrl;
//
//   Gallery({
//     required this.id,
//     required this.eventID,
//     required this.mediaUrl,
//   });
//
//   factory Gallery.fromJson(Map<String, dynamic> json) {
//     List<String> mediaUrlList = List<String>.from(json['mediaUrl']);
//     return Gallery(
//       id: json['_id'],
//       eventID: json['eventID'],
//       mediaUrl: mediaUrlList,
//     );
//   }
// }
//
// class Agenda {
//   Agenda({
//     this.from,
//     this.day,
//     this.agendaTitle,
//     this.to,
//     this.venue,
//     this.streamUrl,
//     this.speaker,
//     this.speakerImg,
//     this.id,
//   });
//
//   Agenda.fromJson(dynamic json) {
//     from = json['from'];
//     day = json['day'];
//     agendaTitle = json['agendaTitle'];
//     to = json['to'];
//     venue = json['venue'];
//     streamUrl = json['streamUrl'];
//     speaker = json['speaker'];
//     speakerImg = json['speakerImg'];
//     id = json['_id'];
//   }
//
//   String? from;
//   int? day;
//   String? agendaTitle;
//   String? to;
//   String? venue;
//   String? streamUrl;
//   String? speaker;
//
//   String? speakerImg;
//   String? id;
// }

