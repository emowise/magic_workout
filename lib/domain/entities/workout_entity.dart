import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:magic_workout/domain/entities/workout_set_entity.dart';
import 'package:magic_workout/resources/enums/workout_type.dart';
import 'package:magic_workout/resources/hive/hive_type_ids.dart';

part 'workout_entity.g.dart';

@HiveType(typeId: HiveIDs.workoutEntityHiveType)
class WorkoutEntity extends Equatable {
  @HiveField(0)
  final WorkoutType workoutType;
  @HiveField(1)
  final int workoutTime;
  @HiveField(2)
  final List<WorkoutSetEntity> workoutSets;

  const WorkoutEntity(
      {required this.workoutType,
      required this.workoutTime,
      required this.workoutSets});

  @override
  // TODO: implement props
  List<Object?> get props => [workoutType, workoutTime, workoutSets];
}
