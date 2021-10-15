import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:song_viewer/models/song.dart';

part 'file_system_event.dart';

part 'file_system_state.dart';

class FileSystemBloc extends HydratedBloc<FileSystemEvent, FileSystemState> {
  FileSystemBloc() : super(FileSystemInitial());

  @override
  Stream<FileSystemState> mapEventToState(
    FileSystemEvent event,
  ) async* {
    if (event is FileSystemSaveFiles) {
      yield SavedFilesInFileSystemState(event.songs);
    }
  }

  @override
  FileSystemState fromJson(Map<String, dynamic> json) => json['songs'] == null
      ? FileSystemInitial()
      : SavedFilesInFileSystemState(
          (json['songs']).map<Song>((song) => Song.fromJson(song)).toList());

  @override
  Map<String, dynamic> toJson(FileSystemState state) => {
        'songs': state is SavedFilesInFileSystemState
            ? (state.songs.isNotEmpty ? Song.toJsonArray(state.songs) : null)
            : null
      };
}
