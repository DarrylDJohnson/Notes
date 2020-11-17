class Note {
  String id;
  String title;
  String note;
  DateTime timeCreated;
  DateTime timeLastUpdated;

  Note({
    this.id,
    this.title,
    this.note,
    this.timeCreated,
    this.timeLastUpdated,
  }) : super();

  Note.fromJson(Map map)
      : this.id = map['id'],
        this.title = map['title'],
        this.note = map['note'],
        this.timeCreated = DateTime.parse(map['timeCreated']),
        this.timeLastUpdated = DateTime.parse(map['timeLastUpdated']);

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'title': this.title,
        'note': this.note,
        'timeCreated': this.timeCreated.toString(),
        'timeLastUpdated': this.timeLastUpdated.toString(),
      };

  @override
  bool operator ==(Object other) {
    if (other is Note) {
      return this.id == other.id;
    } else if (other is String) {
      return this.id == other;
    } else
      return false;
  }
}
