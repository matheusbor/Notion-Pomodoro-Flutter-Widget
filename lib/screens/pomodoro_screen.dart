import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_widget/widgets/home_widget.dart';

class PomodoroScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: HomeWidget(),
      ),
    );
  }

}