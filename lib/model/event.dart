class Event {
  final String id;
  final String title;
  final String description;
  final int startDate;
  final int endDate;
  final String location;
  final List<GalleryItem> gallery;
  final bool deletedCheck;
  final String eventStatus;
  final List<AgendaItem> agenda;
  final String type;
  final String organizer;
  final String organizerContact;
  final String featuredImage;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.gallery,
    required this.deletedCheck,
    required this.eventStatus,
    required this.agenda,
    required this.type,
    required this.organizer,
    required this.organizerContact,
    required this.featuredImage,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    List<dynamic> galleryData = json['gallery'];
    List<dynamic> agendaData = json['agenda'];

    return Event(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      location: json['location'],
      gallery: galleryData.map((item) => GalleryItem.fromJson(item)).toList(),
      deletedCheck: json['deletedCheck'],
      eventStatus: json['eventStatus'],
      agenda: agendaData.map((item) => AgendaItem.fromJson(item)).toList(),
      type: json['type'],
      organizer: json['organizer'],
      organizerContact: json['organizerContact'],
      featuredImage: json['featuredImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'location': location,
      'gallery': gallery.map((item) => item.toJson()).toList(),
      'deletedCheck': deletedCheck,
      'eventStatus': eventStatus,
      'agenda': agenda.map((item) => item.toJson()).toList(),
      'type': type,
      'organizer': organizer,
      'organizerContact': organizerContact,
      'featuredImage': featuredImage,
    };
  }
}

class GalleryItem {
  final String id;
  final String eventID;
  final List<String> mediaUrl;

  GalleryItem({
    required this.id,
    required this.eventID,
    required this.mediaUrl,
  });

  factory GalleryItem.fromJson(Map<String, dynamic> json) {
    List<dynamic> mediaUrlData = json['mediaUrl'];
    return GalleryItem(
      id: json['_id'],
      eventID: json['eventID'],
      mediaUrl: mediaUrlData.map((url) => url as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'eventID': eventID,
      'mediaUrl': mediaUrl,
    };
  }
}

class AgendaItem {
  final String id;
  final String agendaTitle;
  final int day;
  final String from;
  final String to;
  final String venue;
  final String speaker;
  final String? speakerImg;
  final List<String> attachments;
  final String? streamUrl;

  AgendaItem({
    required this.id,
    required this.agendaTitle,
    required this.day,
    required this.from,
    required this.to,
    required this.venue,
    required this.speaker,
    required this.speakerImg,
    required this.attachments,
    required this.streamUrl,
  });

  factory AgendaItem.fromJson(Map<String, dynamic> json) {
    List<dynamic> attachmentsData = json['attachments'];
    return AgendaItem(
      id: json['_id'],
      agendaTitle: json['agendaTitle'],
      day: json['day'],
      from: json['from'],
      to: json['to'],
      venue: json['venue'],
      speaker: json['speaker'],
      speakerImg: json['speakerImg'],
      attachments: attachmentsData.map((attachment) => attachment as String).toList(),
      streamUrl: json['streamUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'agendaTitle': agendaTitle,
      'day': day,
      'from': from,
      'to': to,
      'venue': venue,
      'speaker': speaker,
      'speakerImg': speakerImg,
      'attachments': attachments,
      'streamUrl': streamUrl,
    };
  }
}
