import 'package:flutter/material.dart';
import 'package:magic_workout/presentation/widgets/workout_types_dropdown.dart';
import 'package:magic_workout/resources/enums/workout_type.dart';

class CustomDialog extends StatelessWidget {
  final Function(WorkoutType) selectedWorkoutType;

  const CustomDialog({Key? key, required this.selectedWorkoutType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select workout type"),
      content: WorkoutTypesDropdown(
        selectedWorkoutType: (value) {
          Navigator.pop(context);
          selectedWorkoutType(value);
        },
      ),
    );
  }
}
