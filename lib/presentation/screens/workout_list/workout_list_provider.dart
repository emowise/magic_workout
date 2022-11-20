import 'package:flutter/material.dart';
import 'package:magic_workout/domain/entities/daily_workout_entity.dart';
import 'package:magic_workout/resources/hive/hive.dart';

class WorkoutListProvider extends ChangeNotifier {
  final HiveAdapter<DailyWorkoutEntity> hiveAdapter;

  WorkoutListProvider({required this.hiveAdapter});

  List<dynamic> get keys => List.from(hiveAdapter.keys.toList());

  bool get isNotEmpty => hiveAdapter.keys.isNotEmpty;

  List<DailyWorkoutEntity> get dailyWorkouts =>
      List.from(hiveAdapter.values.toList(), growable: false);

  Future<void> addNewDailyWorkout(DailyWorkoutEntity dailyWorkout) async {
    hiveAdapter.add(dailyWorkout);
    notifyListeners();
  }

  Future<void> updateDailyWorkout(
      dynamic key, DailyWorkoutEntity dailyWorkout) async {
    hiveAdapter.put(key, dailyWorkout);
    notifyListeners();
  }

  void saveDailyWorkout(
      bool isUpdatable, dynamic key, DailyWorkoutEntity dailyWorkout) {
    if (isUpdatable) {
      updateDailyWorkout(key, dailyWorkout);
    } else {
      addNewDailyWorkout(dailyWorkout);
    }
  }

  Future<void> deleteDailyWorkout(dynamic key) async {
    hiveAdapter.delete(key);
    notifyListeners();
  }

  Future<void> getDailyWorkouts() async {
    notifyListeners();
  }
}
