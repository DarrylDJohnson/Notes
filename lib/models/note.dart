class Note {
  String id;
  String title;
  String note;
  DateTime createdTime;
  DateTime updatedTime;

  Note({
    this.id,
    this.title,
    this.note,
    this.createdTime,
    this.updatedTime,
  }) : super();

  Note.fromJson(Map map)
      : this.id = map['id'],
        this.title = map['title'],
        this.note = map['note'],
        this.createdTime = DateTime.parse(map['createdTime']),
        this.updatedTime = DateTime.parse(map['updatedTime']);

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'title': this.title,
        'note': this.note,
        'createdTime': this.createdTime.toString(),
        'updatedTime': this.updatedTime.toString(),
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
