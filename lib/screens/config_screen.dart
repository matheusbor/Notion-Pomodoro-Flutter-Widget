import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_widget/widgets/config_widget.dart';

class ConfigScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.red,

      body: SafeArea(
          child: Center(
              child: ConfigWidget()),
      ),
    );
  }

}