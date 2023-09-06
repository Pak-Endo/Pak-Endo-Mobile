class EventModel {
  String? id;
  String? title;
  String? description;
  int? startDate;
  int? endDate;
  String? location;
  List<Gallery>? gallery;
  bool? deletedCheck;
  String? eventStatus;
  List<Agenda>? agenda;
  String? type;
  String? organizer;
  String? organizerContact;
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
    this.organizer,
    this.organizerContact,
    this.featuredImage,
  });

  EventModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    location = json['location'];
    if (json['gallery'] != null) {
      gallery = [];
      json['gallery'].forEach((v) {
        gallery?.add(Gallery.fromJson(v));
      });
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
    organizer = json['organizer'];
    organizerContact = json['organizerContact'];
    featuredImage = json['featuredImage'];
  }
}

class Agenda {
  Agenda({
    this.from,
    this.day,
    this.agendaTitle,
    this.to,
    this.venue,
    this.streamUrl,
    this.speaker,
    this.id,
  });

  Agenda.fromJson(dynamic json) {
    from = json['from'];
    day = json['day'];
    agendaTitle = json['agendaTitle'];
    to = json['to'];
    venue = json['venue'];
    streamUrl = json['streamUrl'];
    speaker = json['speaker'];
    id = json['_id'];
  }

  String? from;
  int? day;
  String? agendaTitle;
  String? to;
  String? venue;
  String? streamUrl;
  String? speaker;
  String? id;
}

class Gallery {
  Gallery({
    this.id,
    this.eventID,
    this.mediaUrl,
  });

  Gallery.fromJson(dynamic json) {
    id = json['_id'];
    eventID = json['eventID'];
    mediaUrl = json['mediaUrl'] != null ? json['mediaUrl'].cast<String>() : [];
  }

  String? id;
  String? eventID;
  List<String>? mediaUrl;
}
