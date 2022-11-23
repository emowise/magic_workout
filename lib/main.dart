import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:magic_workout/config/routes.dart';
import 'package:magic_workout/domain/entities/daily_workout_entity.dart';
import 'package:magic_workout/domain/entities/workout_set_entity.dart';
import 'package:magic_workout/presentation/screens/workout/workout_provider.dart';
import 'package:magic_workout/presentation/screens/workout/workout_screen.dart';
import 'package:magic_workout/presentation/screens/workout_list/workout_list_provider.dart';
import 'package:magic_workout/presentation/screens/workout_set/workout_form_provider.dart';
import 'package:magic_workout/presentation/screens/workout_set/workout_set_bloc.dart';
import 'package:magic_workout/presentation/screens/workout_set/workout_set_screen.dart';
import 'package:magic_workout/resources/enums/workout_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'domain/entities/workout_entity.dart';
import 'presentation/screens/workout_list/workout_list_screen.dart';
import 'resources/hive/hive_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive
    ..init(path.path)
    ..registerAdapter(WorkoutEntityAdapter())
    ..registerAdapter(WorkoutSetEntityAdapter())
    ..registerAdapter(DailyWorkoutEntityAdapter())
    ..registerAdapter(WorkoutTypeAdapter());

  Box<DailyWorkoutEntity> dailyWorkoutBox =
      await Hive.openBox<DailyWorkoutEntity>('daily-workout-box');

  final HiveAdapter<DailyWorkoutEntity> hiveAdapter =
      HiveAdapter(box: dailyWorkoutBox);

  runApp(MultiProvider(
    providers: [
      InheritedProvider(
        create: (_) => WorkoutFormProvider(),
      ),
      ListenableProvider(
        create: (_) => WorkoutProvider(),
      ),
      ListenableProvider(
        create: (_) =>
            WorkoutListProvider(hiveAdapter: hiveAdapter)..getDailyWorkouts(),
      ),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<WorkoutSetBloc>(create: (_) => WorkoutSetBloc())
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.workoutListScreen: (_) => const WorkoutListScreen(),
        Routes.workoutScreen: (_) => const WorkoutSetScreen(),
        Routes.workoutDailyScreen: (_) => const WorkoutScreen()
      },
      initialRoute: Routes.workoutListScreen,
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
