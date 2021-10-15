import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:song_viewer/database/storage.dart';
import 'package:song_viewer/models/song_category.dart';

part 'load_data_event.dart';

part 'load_data_state.dart';

class LoadDataBloc extends Bloc<LoadDataEvent, LoadDataState> {
  LoadDataBloc() : super(LoadDataInitial());

  @override
  Stream<LoadDataState> mapEventToState(LoadDataEvent event) async* {
    if (event is LoadDataEventLoadData) {
      yield SongsLoaded(Storage.songs);
    }
  }
}
