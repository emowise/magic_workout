import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:magic_workout/resources/hive/hive_type_ids.dart';

part 'workout_set_entity.g.dart';

@HiveType(typeId: HiveIDs.workoutSetEntityHiveType)
class WorkoutSetEntity extends Equatable {
  @HiveField(0)
  final int setCount;
  @HiveField(1)
  final int repeatCount;
  @HiveField(2)
  final int weight;

  const WorkoutSetEntity(this.setCount, this.repeatCount, this.weight);

  @override
  // TODO: implement props
  List<Object?> get props => [setCount, repeatCount, weight];
}
