import 'package:hive/hive.dart';
import 'package:magic_workout/domain/entities/workout_set_entity.dart';
import 'package:magic_workout/resources/hive/hive_type_ids.dart';

@HiveType(typeId: HiveIDs.workoutSetHiveType)
class WorkoutSet extends WorkoutSetEntity {
  const WorkoutSet(super.setCount, super.repeatCount, super.weight);

  factory WorkoutSet.fromJson(Map<String, dynamic> json) {
    return WorkoutSet(json["set_count"], json["repeat_count"], json["weight"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "set_count": setCount,
      "repeat_count": repeatCount,
      "weight": weight
    };
  }
}
