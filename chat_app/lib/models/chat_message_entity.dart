class Chatmessageentity {
  String text;
  String? imageurl;
  String id;
  int createat;

  Author author;

  Chatmessageentity(
      {required this.text,
      required this.id,
      required this.createat,
      this.imageurl,
      required this.author});

  factory Chatmessageentity.fromJson(Map<String, dynamic> json) {
    return Chatmessageentity(
        text: json['text'],
        id: json['id'],
        createat: json['createat'],
        author: Author.fromJson(json['author']),
      imageurl: json['imageurl'],

    );
  }
}

class Author {
  String Username;

  Author({required this.Username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(Username: json['Username']);
  }
}
