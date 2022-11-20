import 'package:flutter/material.dart';
import 'package:magic_workout/presentation/widgets/container_box.dart';
import 'package:magic_workout/resources/enums/workout_type.dart';

class WorkoutTypeContainer extends StatelessWidget {
  final WorkoutType workoutType;

  const WorkoutTypeContainer({Key? key, required this.workoutType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBox(
        title: "Workout Type",
        child: Text(
          workoutType.workoutName,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
