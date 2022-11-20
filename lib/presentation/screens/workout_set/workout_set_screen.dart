import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/config/routes.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/presentation/screens/workout_set/workout_set_bloc.dart';
import 'package:magic_workout/presentation/widgets/general_widgets/appbar_icon_button.dart';
import 'package:magic_workout/presentation/widgets/general_widgets/done_button.dart';
import 'package:magic_workout/presentation/widgets/sets/workout_set_container.dart';
import 'package:magic_workout/presentation/widgets/sets/workout_type_container.dart';
import 'package:magic_workout/resources/enums/status_type.dart';
import 'package:magic_workout/resources/enums/workout_type.dart';
import 'package:provider/provider.dart';

import '../workout/workout_provider.dart';

class WorkoutSetScreen extends StatelessWidget {
  const WorkoutSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dailyWorkoutProvider = Provider.of<WorkoutProvider>(context);
    final workoutType =
        ModalRoute.of(context)!.settings.arguments as WorkoutType;

    return BlocListener<WorkoutSetBloc, WorkoutSetState>(
      listener: (context, state) {
        if (state is WorkoutSetDone) {
          if (state.statusType == StatusTypes.success) {
            dailyWorkoutProvider.addWorkout = WorkoutEntity(
                workoutTime: DateTime.now().millisecondsSinceEpoch,
                workoutType: workoutType,
                workoutSets: state.sets);
            Navigator.pushNamedAndRemoveUntil(context,
                Routes.workoutDailyScreen, (Route<dynamic> route) => false);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppbarIconButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Create Workout"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WorkoutTypeContainer(workoutType: workoutType),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<WorkoutSetBloc, WorkoutSetState>(
                builder: (context, state) {
                  if (state is FetchSets) {
                    return const WorkoutSetContainer();
                  }
                  return const WorkoutSetContainer();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: DoneButton(
          onPressed: () {
            context.read<WorkoutSetBloc>().add(SetDoneEvent());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
