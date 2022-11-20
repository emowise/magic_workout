import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:magic_workout/main.dart' as app;
import 'package:magic_workout/resources/app_keys.dart';
import 'package:magic_workout/resources/enums/enums.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Integration test for adding workout", (tester)async{

    app.main();
    await tester.pumpAndSettle();

    //add new workout
    final Finder newWorkoutButton=find.byKey(AppKeys.newWorkoutButtonKey);
    await tester.tap(newWorkoutButton);
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 3));

    //add new set
    final Finder newSetButton=find.byKey(AppKeys.newSetButtonKey);
    await tester.tap(newSetButton);

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 3));

    final dropdownItem = find.text(WorkoutType.values.first.workoutName).last;

    await tester.tap(dropdownItem);
    await tester.pump(const Duration(seconds: 3));

  });
}