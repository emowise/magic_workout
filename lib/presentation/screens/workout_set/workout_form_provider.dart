import 'package:flutter/cupertino.dart';
import 'package:magic_workout/domain/entities/workout_set_entity.dart';

class WorkoutFormProvider extends ChangeNotifier {
  WorkoutSetEntity? _currentWorkoutSet;

  WorkoutSetEntity? get currentWorkoutSet => _currentWorkoutSet;
  final List<GlobalKey<FormState>> _globalKeyList = [GlobalKey<FormState>()];
  int? _setCount;
  int? _repeatCount;
  int? _weight;

  List<GlobalKey<FormState>> get globalKeyList => _globalKeyList;

  void removeLastKey() {
    _globalKeyList.removeLast();
    notifyListeners();
  }

  set setGlobalKeyList(GlobalKey<FormState> globalKey) {
    _globalKeyList.add(globalKey);
    notifyListeners();
  }

  set setCount(int value) {
    _setCount = value;
    notifyListeners();
  }

  set repeatCount(int value) {
    _repeatCount = value;
    notifyListeners();
  }

  set weight(int value) {
    _weight = value;
    notifyListeners();
  }

  bool get _isValidate =>
      _setCount != null && _repeatCount != null && _weight != null;

  WorkoutSetEntity? workoutSetEntity() {
    if (_isValidate) {
      return WorkoutSetEntity(_setCount!, _repeatCount!, _weight!);
    }

    return null;
  }
}
