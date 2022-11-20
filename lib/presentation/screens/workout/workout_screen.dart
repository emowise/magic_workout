import 'package:flutter/material.dart';
import 'package:magic_workout/config/routes.dart';
import 'package:magic_workout/domain/entities/daily_workout_entity.dart';
import 'package:magic_workout/presentation/screens/workout/workout_provider.dart';
import 'package:magic_workout/presentation/screens/workout_list/workout_list_provider.dart';
import 'package:magic_workout/presentation/widgets/custom_dialog.dart';
import 'package:magic_workout/presentation/widgets/general_widgets/appbar_icon_button.dart';
import 'package:magic_workout/presentation/widgets/general_widgets/done_button.dart';
import 'package:magic_workout/presentation/widgets/general_widgets/empty_list_info.dart';
import 'package:magic_workout/resources/app_keys.dart';
import 'package:provider/provider.dart';

import '../../widgets/workout_list_item.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
      builder: (context, dailyWorkoutProvider, _) => Scaffold(
          appBar: AppBar(
            title: const Text("Daily Workout"),
            leading: AppbarIconButton(
              onPressed: () {
                dailyWorkoutProvider.clearWorkouts();
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.workoutListScreen, (route) => false);
              },
            ),
          ),
          body: dailyWorkoutProvider.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    var current = dailyWorkoutProvider.workouts[index];
                    return WorkoutListItem(workout: current);
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: dailyWorkoutProvider.length)
              : const EmptyListInfo(title: "Create New Sets"),
          floatingActionButton: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 31),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: DoneButton(
                      title: dailyWorkoutProvider.updatable ? "Update" : "Done",
                      onPressed: () {
                        bool isUpdatable = dailyWorkoutProvider.updatable;
                        dynamic boxKey = dailyWorkoutProvider.boxKey;
                        DailyWorkoutEntity dailyWorkout =
                            dailyWorkoutProvider.createDailyWorkout();

                        context.read<WorkoutListProvider>().saveDailyWorkout(
                            isUpdatable, boxKey, dailyWorkout);

                        Navigator.pushNamedAndRemoveUntil(context,
                            Routes.workoutListScreen, (route) => false);
                      }),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                  key: AppKeys.newSetButtonKey,
                  heroTag: "fab_new_set",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return CustomDialog(
                              selectedWorkoutType: (workoutType) {
                            Navigator.pushNamed(context, Routes.workoutScreen,
                                arguments: workoutType);
                          });
                        });
                  },
                  label: const Text("New Set"),
                ),
              ),
            ],
          )),
    );
  }
}
