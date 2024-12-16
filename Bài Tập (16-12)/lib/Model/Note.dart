class Note {
  int? id;
  String username;
  String title;
  String content;
  DateTime createAt;

  Note({
    this.id,
    required this.username,
    required this.title,
    required this.content,
    DateTime? createAt,
  }) : this.createAt = createAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'title': title,
      'content': content,
      'createAt': createAt.toIso8601String(),
    };
  }



factory Note.fromMap (Map<String, dynamic> map){
    return Note(
      id: map['id'],
      username: map['username'],
      title: map['title'],
      content: map['content'],
      createAt: DateTime.parse(map['createAt']),
    );
  }
}