import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/workout_set_entity.dart';
import '../../../resources/enums/status_type.dart';

part 'workout_set_event.dart';
part 'workout_set_state.dart';

class WorkoutSetBloc extends Bloc<WorkoutSetEvent, WorkoutSetState> {
  WorkoutSetBloc() : super(WorkoutInitial()) {
    on<AddNewSetEvent>((event, emit) {
      if (state is FetchSets) {
        final state = this.state as FetchSets;

        emit(FetchSets(sets: List.of(state.sets)..add(event.set)));
      } else {
        emit(FetchSets(sets: [event.set]));
      }
    });

    on<RemoveSetEvent>((event, emit) {
      if (state is FetchSets) {
        final state = this.state as FetchSets;
        emit(FetchSets(sets: List.of(state.sets)..removeLast()));
      }
    });

    on<SetDoneEvent>((event, emit) {
      if (state is FetchSets) {
        final state = this.state as FetchSets;
        if (state.sets.isEmpty) {
          emit(WorkoutSetDone(StatusTypes.error));
        } else {
          emit(WorkoutSetDone(StatusTypes.success, sets: state.sets));
        }
      } else {
        emit(WorkoutSetDone(StatusTypes.info));
      }
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
