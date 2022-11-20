import 'package:hive/hive.dart';
import 'package:magic_workout/resources/hive/hive_type_ids.dart';

part 'workout_type.g.dart';

@HiveType(typeId: HiveIDs.workoutTypeHiveType)
enum WorkoutType {
  @HiveField(0)
  barbellRow("Barbell Row"),
  @HiveField(1)
  benchPress("Bench Press"),
  @HiveField(2)
  shoulderPress("Shoulder Press"),
  @HiveField(3)
  deadLift("Deadlift"),
  @HiveField(4)
  squat("Squat");

  final String workoutName;

  const WorkoutType(this.workoutName);
}
