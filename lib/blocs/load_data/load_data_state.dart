part of 'load_data_bloc.dart';

abstract class LoadDataState extends Equatable {
  const LoadDataState();
}

class LoadDataInitial extends LoadDataState {
  @override
  List<Object> get props => [];
}

class SongsLoaded extends LoadDataState {
  final List<SongCategory> songs;

  const SongsLoaded(this.songs);

  @override
  List<Object> get props => [songs];
}