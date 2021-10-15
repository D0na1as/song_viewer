import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:song_viewer/blocs/file_system/file_system_bloc.dart';
import 'package:song_viewer/blocs/load_data/load_data_bloc.dart';
import 'package:song_viewer/blocs/memory/memory_bloc.dart';
import 'package:song_viewer/constants/app_colors.dart';
import 'package:song_viewer/models/song.dart';
import 'package:song_viewer/models/song_category.dart';
import 'package:song_viewer/screens/category_songs.dart';
import 'package:song_viewer/screens/file_system.dart';
import 'package:song_viewer/screens/memory.dart';
import 'package:song_viewer/utils/time_format.dart';
import 'package:song_viewer/widgets/app_bars.dart';

class InitialScreen extends StatefulWidget {
  @override
  InitialScreenState createState() => InitialScreenState();
}

class InitialScreenState extends State<InitialScreen> {
  late LoadDataBloc _loadDataBloc;

  @override
  void initState() {
    super.initState();
    _loadDataBloc = BlocProvider.of<LoadDataBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoadDataBloc, LoadDataState>(
        builder: (context, state) {
          if (state is SongsLoaded) {
            return CustomScrollView(
              slivers: [
                AppBars.mainAppBar(context: context, title: 'Song Viewer'),
                _buildSongCategories(state.songs),
                _buildStorageTitle(),
                _buildStorageOptions(),
              ],
            );
          } else {
            return CustomScrollView(
              slivers: [
                AppBars.mainAppBar(context: context, title: 'Song Viewer'),
                const SliverFillRemaining(
                  child: Center(child: Text('Data not loaded!')),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildStorageTitle() {
    return const SliverPadding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        sliver: SliverToBoxAdapter(
          child: Text(
            'Storage:',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.accentColor),
          ),
        ));
  }

  Widget _buildSongCategories(List<SongCategory> songs) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.accentColor.withOpacity(0.3),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(3, 3),
                          color: AppColors.secondaryColor.withOpacity(0.3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        _buildTopBar(songs[index]),
                        _buildSongList(songs[index].songs),
                      ],
                    ),
                  ),
                ),
            childCount: songs.length),
      ),
    );
  }

  Widget _buildTopBar(SongCategory songCategory) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          songCategory.title,
          style:
              const TextStyle(fontSize: 25, color: AppColors.backgroundColor),
        ),
        ElevatedButton(
          onPressed: () {
            _onSongCategoryTapped(songCategory);
          },
          child: const Text(
            'See All',
            style: TextStyle(color: AppColors.backgroundColor),
          ),
        ),
      ],
    );
  }

  Widget _buildStorageOptions() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            _buildMemoryInfo(),
            _buildFileSystemInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildMemoryInfo() {
    return GestureDetector(
      onTap: (_loadDataBloc.state is SongsLoaded)
          ? () {
              _onMemoryTapped((_loadDataBloc.state as SongsLoaded).songs);
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(0.3),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 3),
                color: AppColors.secondaryColor.withOpacity(0.3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Memory',
                style:
                    TextStyle(fontSize: 15, color: AppColors.backgroundColor),
              ),
              _buildMemoryTime(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFileSystemInfo() {
    return GestureDetector(
      onTap: (_loadDataBloc.state is SongsLoaded)
          ? () {
              _onFileSystemStorageTapped(
                  (_loadDataBloc.state as SongsLoaded).songs);
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(0.3),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 3),
                color: AppColors.secondaryColor.withOpacity(0.3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'FileSystem',
                style:
                    TextStyle(fontSize: 15, color: AppColors.backgroundColor),
              ),
              _buildFileSystemTime(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemoryTime() {
    return BlocBuilder<MemoryBloc, MemoryState>(
      builder: (context, state) {
        if (state is SavedInMemory && state.songs.isNotEmpty) {
          Duration sum = Duration();
          state.songs.map((song) {
            sum = sum + song.duration;
          }).toList();
          return Text(
            TimeFormat.format(sum),
            style:
                const TextStyle(fontSize: 15, color: AppColors.backgroundColor),
          );
        } else {
          return _buildEmptyText();
        }
      },
    );
  }

  Widget _buildFileSystemTime() {
    return BlocBuilder<FileSystemBloc, FileSystemState>(
      builder: (context, state) {
        if (state is SavedFilesInFileSystemState && state.songs.isNotEmpty) {
          Duration sum = Duration();
          state.songs.map((song) {
            sum = sum + song.duration;
          }).toList();
          return Text(
            TimeFormat.format(sum),
            style:
                const TextStyle(fontSize: 15, color: AppColors.backgroundColor),
          );
        } else {
          return _buildEmptyText();
        }
      },
    );
  }

  Widget _buildEmptyText() {
    return const Text(
      'Empty',
      style: TextStyle(fontSize: 15, color: AppColors.backgroundColor),
    );
  }

  Widget _buildSongList(List<Song> songs) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: songs.length < 5 ? songs.length : 5,
        itemBuilder: (context, index) {
          return _buildSongContainer(songs, index);
        },
      ),
    );
  }

  Widget _buildSongContainer(List<Song> songs, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSongImage(songs, index),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSongTitle(songs, index),
                  _buildSongDetails(songs, index),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSongImage(List<Song> songs, int index) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(songs[index].imageLink),
          ),
        ),
      ),
    );
  }

  Widget _buildSongTitle(List<Song> songs, int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        songs[index].title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: AppColors.accentColor),
      ),
    );
  }

  Widget _buildSongDetails(List<Song> songs, int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${songs[index].size} MB',
            style: const TextStyle(color: AppColors.secondaryColor),
          ),
          Text(
            TimeFormat.format(songs[index].duration),
            style: const TextStyle(color: AppColors.secondaryColor),
          ),
        ],
      ),
    );
  }

  void _onMemoryTapped(List<SongCategory> allSongs) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MemoryScreen(allSongs: allSongs),
      ),
    );
  }

  void _onFileSystemStorageTapped(List<SongCategory> songs) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FileSystemScreen(allSongs: songs),
      ),
    );
  }

  void _onSongCategoryTapped(SongCategory songCategory) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategorySongsScreen(
          songCategory: songCategory,
        ),
      ),
    );
  }
}
