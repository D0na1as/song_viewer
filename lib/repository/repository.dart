import 'package:song_viewer/database/storage.dart';
import 'package:song_viewer/models/song_category.dart';

class Repository {
  List<SongCategory> getSongs() => Storage.songs;
}