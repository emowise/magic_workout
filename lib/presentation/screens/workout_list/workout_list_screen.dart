import 'package:flutter/material.dart';
import 'package:magic_workout/presentation/screens/workout_list/workout_list.dart';
import 'package:magic_workout/resources/app_keys.dart';
import 'package:provider/provider.dart';

import '../../../config/routes.dart';
import '../../../domain/entities/daily_workout_entity.dart';
import '../../widgets/daily_workout_list_item.dart';
import '../../widgets/general_widgets/general_widgets.dart';
import '../workout/workout_provider.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutListProvider>(
      builder: (context, workoutListProvider, _) => Scaffold(
        appBar: AppBar(
          title: const Text("Workouts"),
        ),
        body: Padding(
            padding: const EdgeInsets.only(bottom: 70, top: 10),
            child: workoutListProvider.isNotEmpty
                ? ListView.separated(
                    itemCount: workoutListProvider.keys.length + 1,
                    shrinkWrap: true,
                    separatorBuilder: (context, _) => const Divider(
                          thickness: 1,
                        ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const _WorkoutListTitles();
                      } else {
                        DailyWorkoutEntity dailyWorkout =
                            workoutListProvider.dailyWorkouts[index - 1];
                        dynamic key = workoutListProvider.keys[index - 1];
                        return DailyWorkoutListItem(
                          dailyWorkout: dailyWorkout,
                          boxKey: key,
                          onPressed: () {
                            context
                                .read<WorkoutProvider>()
                                .setSelectedDailyWorkout(key, dailyWorkout);
                            Navigator.pushNamed(
                                context, Routes.workoutDailyScreen);
                          },
                        );
                      }
                    })
                : const EmptyListInfo(title: "You have no workout")),
        floatingActionButton: FloatingActionButton.extended(
          key: AppKeys.newWorkoutButtonKey,
          onPressed: () {
            context.read<WorkoutProvider>().clearWorkouts();
            Navigator.pushNamed(context, Routes.workoutDailyScreen);
          },
          label: const Text("New Workout"),
        ),
      ),
    );
  }
}

class _WorkoutListTitles extends StatelessWidget {
  const _WorkoutListTitles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Expanded(
            child: _TitleText(
          "Workout",
        )),
        Expanded(child: _TitleText("Sets")),
        _TitleText(
          "Date",
        )
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  final String titleText;

  const _TitleText(this.titleText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        titleText,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
