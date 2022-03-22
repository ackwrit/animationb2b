
class Musique{
  late String title;
  late String artist;
  List? genre;
  DateTime? creation;
  String? album;
  double? note;
  String? image;
  late String path;


  Musique({
    required this.path,
    this.image,this.album,
    required this.title,
    required this.artist,
    this.creation,
    this.genre,
    this.note});

}