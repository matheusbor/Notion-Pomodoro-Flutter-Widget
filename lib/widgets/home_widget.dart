import 'package:flutter/material.dart';
import 'package:pomodoro_widget/utils/timer_provider.dart';
import 'package:pomodoro_widget/widgets/timer.dart';
import 'package:provider/provider.dart';


class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
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
              ElevatedButton(
                onPressed: () {
                  context.read<TimerProvider>().useShortBreakTimer();
                },
                child: Text("short break"),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.read<TimerProvider>().useLongBreakTimer();
                },
                child: Text("long break "),
              ),
            ],
          ),
          Spacer(),
          TimerWidget(),
        ],
      ),
    );
  }
}
