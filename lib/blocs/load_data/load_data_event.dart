part of 'load_data_bloc.dart';

abstract class LoadDataEvent extends Equatable {
  const LoadDataEvent();
}

class LoadDataEventLoadData extends LoadDataEvent {
  @override
  List<Object> get props => [];
}
