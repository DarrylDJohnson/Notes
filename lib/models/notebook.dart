import 'dart:ui';

class Notebook {
  String id;
  String title;
  Color color;
  int sortBy;

  Notebook({
    this.id,
    this.color,
    this.title,
    this.sortBy = 0,
  });

  @override
  bool operator ==(Object other) =>
      (other is Notebook) ? (this.id == other.id) : false;
}
