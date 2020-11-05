class Note {
  String id;
  String title;
  String note;

  Note({this.id, this.title, this.note}) : super();

  Map<String, dynamic> toJson() => {
    'id' : this.id,
    'title' : this.title,
    'note' : this.note,
  };
}
