import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_widget/utils/colors.dart';
import 'package:pomodoro_widget/utils/timer_provider.dart';
import 'package:provider/provider.dart';

class ConfigTimers extends StatelessWidget{
  TextEditingController controllerPomodoro = TextEditingController();
  TextEditingController controllerShortBreak = TextEditingController();
  TextEditingController controllerLongBreak = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Theme(
          data: ThemeData(
            primaryColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              isDense: true,
              labelStyle: TextStyle(color: MyColors.gray),
              hintText: "25",
              labelText: "pomodoro",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            controller: controllerPomodoro,
          ),
        ),


        SizedBox(height: 16,),

        Theme(
          data: ThemeData(
            primaryColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              isDense: true,
              labelStyle: TextStyle(color: MyColors.gray),
              hintText: "5",
              labelText: "short break",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            controller: controllerShortBreak,
          ),
        ),

        SizedBox(height: 16,),

        Theme(
          data: ThemeData(
          primaryColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          ),
          ),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              isDense: true,
              labelStyle: TextStyle(color: MyColors.gray),

              hintText: "10",
              labelText: "long break",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            controller: controllerLongBreak,
          ),
        ),

        SizedBox(height: 16,),

        Expanded(
            child:
            Row(
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.red),
                    side: WidgetStatePropertyAll(
                        BorderSide(
                          color: Colors.red,



                    ))
                  ),

                  onPressed: (){
                  controllerPomodoro.clear();
                  controllerShortBreak.clear();
                  controllerLongBreak.clear();
                },
                    child: Text("Reset"),
                ),

                Spacer(),

                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                  ),
                    onPressed: (){
                      final timerProvider = Provider.of<TimerProvider>(context, listen: false);

                      timerProvider.setShortBreakTimer(int.tryParse(controllerShortBreak.text) ?? 5);
                      timerProvider.setLongBreakTimer(int.tryParse(controllerLongBreak.text) ?? 10);

                      timerProvider.setPomodoroTimer(int.tryParse(controllerPomodoro.text) ?? 25);
                    },
                    child: Text("Save"),
                ),
              ],
            ))

      ],
    );
  }

}