part of 'file_system_bloc.dart';

abstract class FileSystemState extends Equatable {
  const FileSystemState();
}

class FileSystemInitial extends FileSystemState {
  @override
  List<Object> get props => [];
}

class SavedFilesInFileSystemState extends FileSystemState {
  final List<Song> songs;

  const SavedFilesInFileSystemState(this.songs);

  @override
  List<Object> get props => [songs];
}
