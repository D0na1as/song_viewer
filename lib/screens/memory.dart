import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:song_viewer/blocs/load_data/load_data_bloc.dart';
import 'package:song_viewer/blocs/memory/memory_bloc.dart';
import 'package:song_viewer/models/song.dart';
import 'package:song_viewer/models/song_category.dart';
import 'package:song_viewer/widgets/app_bars.dart';
import 'package:song_viewer/widgets/song_tile.dart';
import 'package:song_viewer/widgets/storage_state_images.dart';

class MemoryScreen extends StatefulWidget {
  final List<SongCategory> allSongs;

  const MemoryScreen({
    Key? key,
    required this.allSongs,
  }) : super(key: key);

  @override
  _MemoryScreenState createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  List<Song> _songs = [];
  List<Song> _songsToSave = [];
  late MemoryBloc _memoryBloc;

  @override
  void initState() {
    super.initState();
    _memoryBloc = BlocProvider.of<MemoryBloc>(context);
    widget.allSongs.map((categorySongs) {
      _songs = _songs + categorySongs.songs;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBars.secondaryAppBar(context: context, title: 'Memory'),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            sliver: _buildSongsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSongsList() {
    return BlocBuilder<MemoryBloc, MemoryState>(builder: (context, state) {
      if (state is SavedInMemory) {
        return _buildListContainer(state.songs);
      } else {
        return _buildListContainer([]);
      }
    });
  }

  SliverList _buildListContainer(List<Song> savedSongs) {
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
        _songsToSave = [];
        _songsToSave.add(savingSong);
        _songsToSave = _songsToSave + savedSongs;
        _memoryBloc.add(MemoryEventSaveInMemory(_songsToSave));
        setState(() {});
      },
      child: StorageStateImages.toSave(),
    );
  }
}
