import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/presentation/screens/workout/workout_provider.dart';
import 'package:magic_workout/resources/extensions/date_time_extensions.dart';

import '../../domain/entities/workout_entity.dart';
import '../../domain/entities/workout_set_entity.dart';

class WorkoutListItem extends StatelessWidget {
  final WorkoutEntity workout;

  const WorkoutListItem({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text(workout.workoutType.workoutName, style: _textStyle)),
          Expanded(child: _WorkoutCountItems(workoutSets: workout.workoutSets)),
          Text(
              DateTime.fromMillisecondsSinceEpoch(workout.workoutTime)
                  .fromMillsToDateTime,
              style: _textStyle),
          IconButton(
              onPressed: () {
                context.read<WorkoutProvider>().removeWorkOut = workout;
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}

class _WorkoutCountItems extends StatelessWidget {
  final List<WorkoutSetEntity> workoutSets;

  const _WorkoutCountItems({Key? key, required this.workoutSets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: workoutSets
          .map(
            (e) => Text(
              '${e.repeatCount}x${e.weight} kg',
              style: _textStyle,
            ),
          )
          .toList(),
    );
  }
}

TextStyle _textStyle = const TextStyle(color: Colors.white);
