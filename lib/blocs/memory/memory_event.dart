part of 'memory_bloc.dart';

abstract class MemoryEvent extends Equatable {
  const MemoryEvent();
  @override
  List<Object> get props => [];
}

class MemoryEventSaveInMemory extends MemoryEvent {
  final List<Song> songs;

   const MemoryEventSaveInMemory(this.songs);

  @override
  List<Object> get props => [songs];
}
