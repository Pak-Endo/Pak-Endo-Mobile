class EventModel {
  String? id;
  String? title;
  String? description;
  int? startDate;
  int? endDate;
  Location? location;
  Gallery? gallery;
  bool? deletedCheck;
  String? eventStatus;
  List<Agenda>? agenda;
  String? type;
  GrandSponsor? grandSponsor;
  String? grandSponsorContact;
  bool? openForPublic;
  int? fees;
  bool? isFavorite;
  bool? isAttended;
  String? featuredImage;

  EventModel({
    this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.location,
    this.gallery,
    this.deletedCheck,
    this.eventStatus,
    this.agenda,
    this.type,
    this.grandSponsor,
    this.grandSponsorContact,
    this.openForPublic,
    this.fees,
    this.isFavorite,
    this.isAttended,
    this.featuredImage,
  });

  EventModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    gallery = Gallery.fromJson((json['gallery'] as List).first);
    deletedCheck = json['deletedCheck'];
    eventStatus = json['eventStatus'];
    if (json['agenda'] != null) {
      agenda = [];
      json['agenda'].forEach((v) {
        agenda?.add(Agenda.fromJson(v));
      });
    }
    type = json['type'];
    grandSponsor = json['grandSponsor'] != null
        ? GrandSponsor.fromJson(json['grandSponsor'])
        : null;
    grandSponsorContact = json['grandSponsorContact'];
    openForPublic = json['openForPublic'];
    fees = json['fees'];
    isFavorite = json['isFavorite'];
    isAttended = json['isAttended'];
    featuredImage = json['featuredImage'];
  }
}

class GrandSponsor {
  String? id;
  String? name;

  GrandSponsor({this.id, this.name});

  GrandSponsor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}

class Agenda {
  String? id;
  String? theme;
  String? sponsor;
  String? agendaTitle;
  int? day;
  String? from;
  String? to;
  String? hall;
  String? streamUrl;
  String? speaker;
  String? speakerImg;
  List<SpeakerTeam>? speakerTeam;
  List<String>? attachments;

  Agenda({
    this.id,
    this.theme,
    this.sponsor,
    this.agendaTitle,
    this.day,
    this.from,
    this.to,
    this.hall,
    this.streamUrl,
    this.speaker,
    this.speakerImg,
    this.speakerTeam,
    this.attachments,
  });

  Agenda.fromJson(dynamic json) {
    id = json['_id'];
    theme = json['theme'];
    sponsor = json['sponsor'];
    agendaTitle = json['agendaTitle'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    hall = json['hall'];
    streamUrl = json['streamUrl'];
    speaker = json['speaker'];
    speakerImg = json['speakerImg'];
    if (json['speakerTeam'] != null) {
      speakerTeam = [];
      json['speakerTeam'].forEach((v) {
        speakerTeam?.add(SpeakerTeam.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      attachments = [];
      json['attachments'].forEach((v) {
        attachments?.add(v);
      });
    }
  }
}

class SpeakerTeam {
  String? name;
  String? role;

  SpeakerTeam({this.name, this.role});

  SpeakerTeam.fromJson(dynamic json) {
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['role'] = role;
    return map;
  }
}

class Gallery {
  final String id;
  final String eventID;
  final List<String> mediaUrl;

  Gallery({required this.id, required this.eventID, required this.mediaUrl});

  factory Gallery.fromJson(Map<String, dynamic> json) {
    List<String> mediaUrlList = List<String>.from(json['mediaUrl']);
    return Gallery(
      id: json['_id'],
      eventID: json['eventID'],
      mediaUrl: mediaUrlList,
    );
  }
}

class Location {
  String? id;
  String? name;

  Location({this.id, this.name});

  Location.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}