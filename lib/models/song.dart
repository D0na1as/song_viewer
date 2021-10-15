import 'package:equatable/equatable.dart';

class Song extends Equatable {
  final String title;
  final String imageLink;
  final Duration duration;
  final double size;

  const Song({
    required this.title,
    required this.imageLink,
    required this.duration,
    required this.size
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        title: json['songTitle'],
        imageLink: 'image',
        duration: Duration(seconds: json['songDuration']),
        size: json['size'],
      );

  Map<String, dynamic> toJson() => {
        'songTitle': title,
        'image': imageLink,
        'songDuration': duration.inSeconds,
         'size': size,
      };

  static toJsonArray(List<Song> list) =>
      list.map((song) => song.toJson()).toList();

  @override
  List<Object> get props => [
        title,
        imageLink,
        duration,
        size,
      ];
}
