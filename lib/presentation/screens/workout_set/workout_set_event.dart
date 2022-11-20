part of 'workout_set_bloc.dart';

abstract class WorkoutSetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddNewSetEvent extends WorkoutSetEvent {
  final WorkoutSetEntity set;

  AddNewSetEvent(this.set);

  @override
  List<Object?> get props => [set];
}

class RemoveSetEvent extends WorkoutSetEvent {}

class SetDoneEvent extends WorkoutSetEvent {}
