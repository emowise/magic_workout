part of 'workout_set_bloc.dart';

abstract class WorkoutSetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WorkoutInitial extends WorkoutSetState {}

class FetchSets extends WorkoutSetState {
  final List<WorkoutSetEntity> sets;

  FetchSets({this.sets = const []});

  @override
  List<Object?> get props => [sets];

  FetchSets copyWith(List<WorkoutSetEntity> sets) {
    return FetchSets(sets: sets);
  }
}

class WorkoutSetDone extends WorkoutSetState {
  final StatusTypes statusType;
  final List<WorkoutSetEntity> sets;

  WorkoutSetDone(this.statusType, {this.sets = const []});

  @override
  List<Object?> get props => [statusType];
}
