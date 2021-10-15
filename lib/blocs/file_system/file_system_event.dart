part of 'file_system_bloc.dart';

abstract class FileSystemEvent extends Equatable {
  const FileSystemEvent();
}

class FileSystemSaveFiles extends FileSystemEvent {
  final List<Song> songs;

  const FileSystemSaveFiles(this.songs);

  @override
  List<Object> get props => [songs];
}