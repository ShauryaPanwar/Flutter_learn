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
}
class Author{

  String Username;
  Author({required this.Username});
}