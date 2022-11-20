import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:magic_workout/resources/hive/hive_type_ids.dart';

import 'workout_entity.dart';

part 'daily_workout_entity.g.dart';

@HiveType(typeId: HiveIDs.dailyWorkoutEntityHiveType)
class DailyWorkoutEntity extends Equatable {
  @HiveField(0)
  final int workoutTime;
  @HiveField(1)
  final List<WorkoutEntity> workouts;

  const DailyWorkoutEntity({required this.workoutTime, required this.workouts});

  factory DailyWorkoutEntity.copy(DailyWorkoutEntity dailyWorkout) {
    return DailyWorkoutEntity(
        workoutTime: dailyWorkout.workoutTime,
        workouts: List.from(dailyWorkout.workouts));
  }

  @override
  List<Object?> get props => [workoutTime, workouts];
}
