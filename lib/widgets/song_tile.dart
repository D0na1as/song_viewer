import 'package:flutter/material.dart';
import 'package:song_viewer/constants/app_colors.dart';
import 'package:song_viewer/models/song.dart';
import 'package:song_viewer/utils/time_format.dart';

class SongTile extends StatelessWidget {
  final Song song;

  const SongTile({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.secondaryColor, width: 1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(song.title),
              Row(
                children: [
                  Text('${song.size}MB - '),
                  Text(TimeFormat.format(song.duration)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
