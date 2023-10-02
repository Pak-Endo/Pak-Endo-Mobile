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
  List<GrandSponsor>? grandSponsor;
  bool? openForPublic;
  List<Fees>? fees;
  bool? isFavorite;
  bool? isAttended;
  String? createdAt;
  String? featuredImage;
  int? contactNumber;
  String? contactPerson;

  EventModel(
      {this.id,
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
    this.openForPublic,
    this.fees,
    this.isFavorite,
    this.isAttended,
    this.createdAt,
    this.featuredImage,
    this.contactNumber,
    this.contactPerson
  });

  EventModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['gallery'] != null) {
      gallery = Gallery.fromJson((json['gallery'] as List).first);
    }
    deletedCheck = json['deletedCheck'];
    eventStatus = json['eventStatus'];
    if (json['agenda'] != null) {
      agenda = [];
      json['agenda'].forEach((v) {
        agenda?.add(Agenda.fromJson(v));
      });
    }
    type = json['type'];
    if (json['grandSponsor'] != null) {
      grandSponsor = [];
      json['grandSponsor'].forEach((v) {
        grandSponsor?.add(GrandSponsor.fromJson(v));
      });
    }
    openForPublic = json['openForPublic'];
    if (json['fees'] != null) {
      fees = [];
      json['fees'].forEach((v) {
        fees?.add(Fees.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
    isAttended = json['isAttended'];
    createdAt = json['createdAt'];
    featuredImage = json['featuredImage'];
    contactNumber = json['contactNumber'];
    contactPerson = json['contactPerson'];
  }
}

class Fees {
  Fees({
    this.feeType,
    this.feeValue
  });

  Fees.fromJson(dynamic json) {
    feeType = json['feeType'];
    feeValue = json['feeValue'];
  }

  String? feeType;
  String? feeValue;
}

class GrandSponsor {
  GrandSponsor({
    this.id,
    this.name,
    this.logo,
    this.contact,
  });

  GrandSponsor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    contact = json['contact'];
  }

  String? id;
  String? name;
  String? logo;
  String? contact;
}

class Agenda {
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
    this.speakerDesignation,
    this.speakerImg,
    this.speakerTeam,
    this.attachments,
  });

  Agenda.fromJson(dynamic json) {
    id = json['_id'];
    theme = json['theme'];
    sponsor =
        json['sponsor'] != null ? Sponsor.fromJson(json['sponsor']) : null;
    agendaTitle = json['agendaTitle'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    hall = json['hall'];
    streamUrl = json['streamUrl'];
    speaker = json['speaker'];
    speakerDesignation = json['speakerDesignation'];
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

  String? id;
  String? theme;
  Sponsor? sponsor;
  String? agendaTitle;
  int? day;
  String? from;
  String? to;
  String? hall;
  String? streamUrl;
  String? speaker;
  String? speakerDesignation;
  String? speakerImg;
  List<SpeakerTeam>? speakerTeam;
  List<String>? attachments;
}

class SpeakerTeam {
  SpeakerTeam({
    this.name,
    this.role,
  });

  SpeakerTeam.fromJson(dynamic json) {
    name = json['name'];
    role = json['role'];
  }

  String? name;
  String? role;
}

class Sponsor {
  Sponsor({
    this.id,
    this.sponsorName,
    this.uniqueID,
    this.sponsorLogo,
    this.description,
    this.deletedCheck,
    this.contact,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Sponsor.fromJson(dynamic json) {
    id = json['_id'];
    sponsorName = json['sponsorName'];
    uniqueID = json['uniqueID'];
    sponsorLogo = json['sponsorLogo'];
    description = json['description'];
    deletedCheck = json['deletedCheck'];
    contact = json['contact'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? sponsorName;
  String? uniqueID;
  String? sponsorLogo;
  String? description;
  bool? deletedCheck;
  String? contact;
  String? createdAt;
  String? updatedAt;
  int? v;
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
  Location({
    this.id,
    this.name,
  });

  Location.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}