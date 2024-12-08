import 'package:flutter/material.dart';
import 'package:pomodoro_widget/screens/config_screen.dart';
import 'package:pomodoro_widget/utils/timer_provider.dart';
import 'package:pomodoro_widget/widgets/config_widget.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';


class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late StopWatchTimer stopWatchTimer;

  @override
  void initState() {
    super.initState();
    final timerProvider = context.read<TimerProvider>();
    stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromMinute(timerProvider.currentTimer),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final timerProvider = context.watch<TimerProvider>();

    // Atualiza o tempo do timer sempre que as dependências mudarem
    stopWatchTimer.setPresetTime(
      mSec: StopWatchTimer.getMilliSecFromMinute(timerProvider.currentTimer),
      add: false,
    );
  }

  @override
  void dispose() async {
    super.dispose();
    await stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: stopWatchTimer.rawTime,
        initialData: stopWatchTimer.initialPresetTime,
        builder: (context, snapshot) {
          final value = snapshot.data ?? 0;
          final displayTime = StopWatchTimer.getDisplayTime(
            value,
            milliSecond: false,
            hours: false,
          );

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                displayTime,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: stopWatchTimer.onResetTimer,
                    icon: Icon(Icons.refresh, color: Colors.black),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {});
                      if (stopWatchTimer.isRunning) {
                        stopWatchTimer.onStopTimer();
                      } else {
                        stopWatchTimer.onStartTimer();
                      }
                    },
                    icon: Icon(
                      stopWatchTimer.isRunning
                          ? Icons.pause_outlined
                          : Icons.play_arrow_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfigScreen()),
                      ).then((_) {
                        setState(() {
                        });
                      });
                    },
                    icon: Icon(Icons.settings, color: Colors.black),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
