import 'package:flutter/material.dart';
import 'package:pomodoro_widget/utils/timer_provider.dart';
import 'package:pomodoro_widget/widgets/timer.dart';
import 'package:provider/provider.dart';


class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 400,
        maxWidth: 450,//permitir o usuário escolher a largura?
        minHeight: 284,
        minWidth: 287,
      ),

      child: Container(

        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.white),
        ),
        child: LayoutBuilder(
          builder: (context, constraints){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.black, width: 1),
                        ),
                        onPressed: () {
                          context.read<TimerProvider>().usePomodoroTimer();
                        },
                        child: Text("pomodoro"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [

                    Expanded(
                      flex: constraints.maxWidth<334? (constraints.maxWidth<298? 9:4):2,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                        minWidth: 120,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            side: BorderSide(color: Colors.black, width: 1),

                          ),
                          onPressed: () {
                            context.read<TimerProvider>().useShortBreakTimer();
                          },

                          child: Text("short break"),
                        ),
                      ),
                    ),
                    Expanded(child: Spacer()),
                    Expanded(
                      flex: constraints.maxWidth<334? (constraints.maxWidth<298? 9:4):2,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 120,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<TimerProvider>().useLongBreakTimer();
                          },
                          style: ElevatedButton.styleFrom(

                            side: BorderSide(color: Colors.black, width: 1),

                          ),
                          child: Text("long break"),
                        ),
                      ),
                    )
                  ],
                ),


                TimerWidget(),
              ],
            );
          }

        ),
      ),
    );
  }
}
