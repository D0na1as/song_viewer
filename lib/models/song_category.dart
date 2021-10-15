import 'package:equatable/equatable.dart';
import 'package:song_viewer/models/song.dart';

class SongCategory extends Equatable {
  final String title;
  final List<Song> songs;

  const SongCategory({
    required this.title,
    required this.songs,
  });

  factory SongCategory.fromJson(Map<String, dynamic> json) => SongCategory(
        title: 'categoryTitle',
        songs: List<Song>.from(
            json['songsList'].map<Song>((data) => Song.fromJson(data))),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'songsList': Song.toJsonArray(songs),
      };

  static toJsonArray(List<Song> list) {
    return list.map((song) => song.toJson()).toList();
  }

  @override
  List<Object> get props => [
        title,
        songs,
      ];
}
