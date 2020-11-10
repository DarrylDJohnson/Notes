class Note {
  String id;
  String title;
  String note;

  Note({this.id, this.title, this.note}) : super();

  Note.fromJson(Map map)
      : this.id = map['id'],
        this.title = map['title'],
        this.note = map['note'];

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'title': this.title,
        'note': this.note,
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
