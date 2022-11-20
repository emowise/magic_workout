import 'package:flutter/material.dart';
import 'package:magic_workout/resources/enums/workout_type.dart';

class WorkoutTypesDropdown extends StatefulWidget {
  final bool useFirstValue;
  final Function(WorkoutType) selectedWorkoutType;

  const WorkoutTypesDropdown(
      {Key? key, required this.selectedWorkoutType, this.useFirstValue = false})
      : super(key: key);

  @override
  State<WorkoutTypesDropdown> createState() => _WorkoutTypesDropdownState();
}

class _WorkoutTypesDropdownState extends State<WorkoutTypesDropdown> {
  late WorkoutType? value;

  @override
  void initState() {
    super.initState();

    value = widget.useFirstValue ? WorkoutType.values.first : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<WorkoutType>(
        value: value,
        hint: widget.useFirstValue ? null : const Text("Select workout Type"),
        items: WorkoutType.values
            .map<DropdownMenuItem<WorkoutType>>((e) =>
                DropdownMenuItem<WorkoutType>(
                    value: e, child: Text(e.workoutName)))
            .toList(),
        onChanged: (type) {
          widget.selectedWorkoutType(type!);
          setState(() {
            value = type;
          });
        });
  }
}
