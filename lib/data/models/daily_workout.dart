import 'package:hive/hive.dart';
import 'package:magic_workout/domain/entities/daily_workout_entity.dart';
import 'package:magic_workout/resources/hive/hive_type_ids.dart';

@HiveType(typeId: HiveIDs.dailyWorkoutHiveType)
class DailyWorkout extends DailyWorkoutEntity {
  const DailyWorkout({required super.workoutTime, required super.workouts});
}
