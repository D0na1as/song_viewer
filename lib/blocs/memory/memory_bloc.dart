import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:song_viewer/models/song.dart';
part 'memory_event.dart';

part 'memory_state.dart';

class MemoryBloc extends Bloc<MemoryEvent, MemoryState> {
  MemoryBloc() : super(MemoryInitial());

  @override
  Stream<MemoryState> mapEventToState(
    MemoryEvent event,
  ) async* {
    if (event is MemoryEventSaveInMemory) {
      yield SavedInMemory(event.songs);
    }
  }
}
