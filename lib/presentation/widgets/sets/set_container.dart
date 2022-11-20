import 'package:flutter/material.dart';
import 'package:magic_workout/domain/entities/workout_set_entity.dart';
import 'package:magic_workout/presentation/screens/workout_set/workout_set_bloc.dart';
import 'package:magic_workout/presentation/widgets/list_item_delete_button.dart';
import 'package:magic_workout/presentation/widgets/sets/set_text_field.dart';
import 'package:provider/provider.dart';

import '../../screens/workout_set/workout_form_provider.dart';

class SetContainer extends StatefulWidget {
  final WorkoutSetEntity? set;
  final GlobalKey<FormState> globalKey;
  final bool showDelete;

  const SetContainer(
      {Key? key, this.set, required this.globalKey, this.showDelete = true})
      : super(key: key);

  @override
  State<SetContainer> createState() => SetContainerState();
}

class SetContainerState extends State<SetContainer> {
  late TextEditingController setController;

  late TextEditingController repsController;
  late TextEditingController weightController;
  late WorkoutFormProvider workoutSetProvider;

  late GlobalKey<FormState> _globalKey;

  @override
  void initState() {
    super.initState();
    _globalKey = widget.globalKey;

    workoutSetProvider = context.read<WorkoutFormProvider>();
    workoutSetProvider.setGlobalKeyList = _globalKey;

    setController = TextEditingController(text: widget.set?.weight.toString());
    repsController =
        TextEditingController(text: widget.set?.repeatCount.toString());
    weightController =
        TextEditingController(text: widget.set?.repeatCount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Form(
        key: _globalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SetTextField(
                  controller: setController,
                  title: "Sets",
                  onValue: (value) {
                    workoutSetProvider.setCount = int.parse(value.toString());
                  },
                ),
                const VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 5,
                  indent: 5,
                ),
                SetTextField(
                    controller: repsController,
                    title: "Reps",
                    onValue: (value) {
                      workoutSetProvider.repeatCount =
                          int.parse(value.toString());
                    }),
                const VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 5,
                  indent: 5,
                ),
                SetTextField(
                    controller: weightController,
                    title: "Kg",
                    maxLength: 3,
                    onValue: (value) {
                      workoutSetProvider.weight = int.parse(value.toString());
                    })
              ],
            ),
            if (widget.showDelete) _DeleteWidget()
          ],
        ),
      ),
    );
  }
}

class _DeleteWidget extends StatelessWidget {
  const _DeleteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: Colors.white,
        )),
        ListItemDeleteIcon(onPressed: () {
          context.read<WorkoutSetBloc>().add(RemoveSetEvent());
          context.read<WorkoutFormProvider>().removeLastKey();
        }),
        const Expanded(
            child: Divider(
          color: Colors.white,
        )),
      ],
    );
  }
}
