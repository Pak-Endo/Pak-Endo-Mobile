class EventModel {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String organizer;
  final String featuredImage;
  final List<Map<String, dynamic>> agenda;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.organizer,
    required this.featuredImage,
    required this.agenda,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.fromMillisecondsSinceEpoch(json['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(json['endDate']),
      location: json['location'],
      organizer: json['organizer'],
      featuredImage: json['featuredImage'],
      agenda: List<Map<String, dynamic>>.from(json['agenda']),
    );
  }
}
