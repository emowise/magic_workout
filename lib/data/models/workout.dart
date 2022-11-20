import 'package:hive/hive.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/resources/hive/hive_type_ids.dart';

@HiveType(typeId: HiveIDs.workoutHiveType)
class Workout extends WorkoutEntity {
  const Workout(
      {required super.workoutType,
      required super.workoutTime,
      required super.workoutSets});

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
        workoutType: json["workout_type"],
        workoutTime: json["workout_time"],
        workoutSets: json["workout_sets"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "workout_type": workoutType,
      "workout_time": workoutTime,
      "workoutSets": workoutSets
    };
  }
}
