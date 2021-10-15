import 'package:flutter/material.dart';
import 'package:song_viewer/models/song_category.dart';
import 'package:song_viewer/models/song.dart';
import 'package:song_viewer/widgets/app_bars.dart';
import 'package:song_viewer/widgets/song_tile.dart';
import 'package:song_viewer/widgets/storage_state_images.dart';

class CategorySongsScreen extends StatefulWidget {
  final SongCategory songCategory;

  const CategorySongsScreen({
    Key? key,
    required this.songCategory,
  }) : super(key: key);

  @override
  _CategorySongsScreenState createState() => _CategorySongsScreenState();
}

class _CategorySongsScreenState extends State<CategorySongsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBars.secondaryAppBar(
              context: context, title: widget.songCategory.title),
          _buildSongsList(),
        ],
      ),
    );
  }

  Widget _buildSongsList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Row(
                children: [
                  SongTile(
                    song: widget.songCategory.songs[index],
                  ),
                ],
              ),
          childCount: widget.songCategory.songs.length),
    );
  }
}
