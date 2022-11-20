import 'package:flutter/material.dart';
import 'package:magic_workout/presentation/widgets/sets/set_container.dart';

import '../../../domain/entities/workout_set_entity.dart';

class WorkoutSetList extends StatelessWidget {
  final List<WorkoutSetEntity> sets;

  const WorkoutSetList({
    Key? key,
    this.sets = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        shrinkWrap: true,
        itemCount: sets.length + 1,
        itemBuilder: (context, index) {
          var globalKey = GlobalKey<FormState>();
          if (sets.isNotEmpty && index != sets.length + 1 - 1) {
            return SetContainer(
              showDelete: index != 0,
              globalKey: globalKey,
              set: sets[index],
            );
          }
          return SetContainer(showDelete: index != 0, globalKey: globalKey);
        });
  }
}
