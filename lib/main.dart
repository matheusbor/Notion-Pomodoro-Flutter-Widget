import 'package:flutter/material.dart';
import 'package:pomodoro_widget/screens/pomodoro_screen.dart';
import 'package:pomodoro_widget/utils/colors.dart';
import 'package:pomodoro_widget/utils/timer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (_) => TimerProvider(),
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notion Pomodoro Widget',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.red),
        useMaterial3: true,
      ),
      home: PomodoroScreen(),
    );
  }
}
