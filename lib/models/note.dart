class Note {
  String notebookId;
  String id;
  String title;
  String note;

  Note({
    this.notebookId,
    this.id,
    this.title,
    this.note,
  });

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
