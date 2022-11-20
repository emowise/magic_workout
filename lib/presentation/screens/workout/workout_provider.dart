import 'package:flutter/material.dart';

import '../../../domain/entities/daily_workout_entity.dart';
import '../../../domain/entities/workout_entity.dart';

class WorkoutProvider extends ChangeNotifier {
  final List<WorkoutEntity> _workouts = [];

  List<WorkoutEntity> get workouts => List.from(_workouts);

  bool get isNotEmpty => _workouts.isNotEmpty;

  int get length => _workouts.length;

  bool get updatable => _selectedDailyWorkout != null;

  DailyWorkoutEntity? _selectedDailyWorkout;

  DailyWorkoutEntity? get selectedDailyWorkout => _selectedDailyWorkout;

  dynamic _boxKey;

  dynamic get boxKey => _boxKey;

  void setSelectedDailyWorkout(
      dynamic boxKey, DailyWorkoutEntity? dailyWorkoutEntity) {
    _boxKey = boxKey;
    _selectedDailyWorkout = dailyWorkoutEntity;
    _workouts.addAll(_selectedDailyWorkout!.workouts);
    notifyListeners();
  }

  void updateSelectedWorkout() {}

  set addWorkout(WorkoutEntity workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  set removeWorkOut(WorkoutEntity workout) {
    _workouts.remove(workout);
    notifyListeners();
  }

  void clearWorkouts() {
    _workouts.clear();
    _selectedDailyWorkout = null;
    _boxKey = null;
    notifyListeners();
  }

  DailyWorkoutEntity createDailyWorkout() => DailyWorkoutEntity(
        workoutTime: DateTime.now().millisecondsSinceEpoch,
        workouts: List.from(_workouts),
      );
}
