import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:song_viewer/blocs/file_system/file_system_bloc.dart';
import 'package:song_viewer/models/song.dart';
import 'package:song_viewer/models/song_category.dart';
import 'package:song_viewer/widgets/app_bars.dart';
import 'package:song_viewer/widgets/song_tile.dart';
import 'package:song_viewer/widgets/storage_state_images.dart';

class FileSystemScreen extends StatefulWidget {
  final List<SongCategory> allSongs;

  const FileSystemScreen({
    Key? key,
    required this.allSongs,
  }) : super(key: key);

  @override
  _FileSystemScreenState createState() => _FileSystemScreenState();
}

class _FileSystemScreenState extends State<FileSystemScreen> {
  List<Song> _songs = [];
  List<Song> _songsToSave = [];
  late FileSystemBloc _fileSystemBloc;

  @override
  void initState() {
    super.initState();
    _fileSystemBloc = BlocProvider.of<FileSystemBloc>(context);
    widget.allSongs.map((categorySongs) {
      _songs = _songs + categorySongs.songs;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBars.secondaryAppBar(context: context, title: 'File System'),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            sliver: _buildSongsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSongsList() {
    return BlocBuilder<FileSystemBloc, FileSystemState>(
        builder: (context, state) {
      if (state is SavedFilesInFileSystemState) {
        return _buildListContainer(state.songs);
      } else {
        return _buildListContainer([]);
      }
    });
  }

  Widget _buildListContainer(List<Song> savedSongs) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Row(
                children: [
                  SongTile(
                    song: _songs[index],
                  ),
                  savedSongs.isNotEmpty
                      ? savedSongs
                              .any((song) => song.title == _songs[index].title)
                          ? StorageStateImages.saved()
                          : _buildSaveSong(savedSongs, _songs[index])
                      : _buildSaveSong([], _songs[index]),
                ],
              ),
          childCount: _songs.length),
    );
  }

  Widget _buildSaveSong(List<Song> savedSongs, Song savingSong) {
    return GestureDetector(
      onTap: () {
        savedSongs.add(savingSong);
        _fileSystemBloc.add(FileSystemSaveFiles(savedSongs));
        setState(() {});
      },
      child: StorageStateImages.toSave(),
    );
  }
}
