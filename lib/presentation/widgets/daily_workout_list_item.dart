import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/domain/entities/workout_set_entity.dart';
import 'package:magic_workout/presentation/screens/workout_list/workout_list_provider.dart';
import 'package:magic_workout/presentation/widgets/list_item_delete_button.dart';
import 'package:magic_workout/resources/extensions/date_time_extensions.dart';

import '../../domain/entities/daily_workout_entity.dart';

class DailyWorkoutListItem extends StatelessWidget {
  final DailyWorkoutEntity dailyWorkout;
  final dynamic boxKey;
  final VoidCallback onPressed;

  const DailyWorkoutListItem(
      {Key? key,
      required this.dailyWorkout,
      this.boxKey,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: dailyWorkout.workouts
                  .map((workout) => Row(
                        children: [
                          Expanded(
                              child: Text(workout.workoutType.workoutName)),
                          Expanded(
                              child: Text('x${workout.workoutSets.length}'))
                        ],
                      ))
                  .toList(),
            )),
            Text(DateTime.fromMillisecondsSinceEpoch(dailyWorkout.workoutTime)
                .fromMillsToDateTime),
            ListItemDeleteIcon(onPressed: () {
              context.read<WorkoutListProvider>().deleteDailyWorkout(boxKey);
            })
          ],
        ),
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
          .map((e) => Text('${e.repeatCount}x${e.weight} kg'))
          .toList(),
    );
  }
}
