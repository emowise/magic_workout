import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/domain/entities/workout_set_entity.dart';
import 'package:magic_workout/presentation/widgets/container_box.dart';
import 'package:magic_workout/presentation/widgets/general_widgets/submit_button.dart';
import 'package:magic_workout/presentation/widgets/sets/workout_set_list.dart';

import '../../screens/workout_set/workout_form_provider.dart';
import '../../screens/workout_set/workout_set_bloc.dart';

class WorkoutSetContainer extends StatelessWidget {
  const WorkoutSetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBox(
        title: "Sets",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<WorkoutSetBloc, WorkoutSetState>(
                builder: (context, state) {
              if (state is FetchSets) {
                return WorkoutSetList(sets: state.sets);
              }
              return const WorkoutSetList();
            }),
            const Divider(
              thickness: 1,
              color: Colors.black54,
            ),
            const SizedBox(
              height: 16,
            ),
            SubmitButton(
                onPressed: () {
                  var key =
                      context.read<WorkoutFormProvider>().globalKeyList.last;
                  if (key.currentState!.validate()) {
                    key.currentState!.save();
                    WorkoutSetEntity workoutSet =
                        context.read<WorkoutFormProvider>().workoutSetEntity()!;
                    context
                        .read<WorkoutSetBloc>()
                        .add(AddNewSetEvent(workoutSet));
                  }
                },
                icon: const Icon(
                  Icons.add,
                  size: 15,
                ),
                labelText: "Add Different Set")
          ],
        ));
  }
}
