import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  int _currentTimer = 25;
  int _pomodoroTimer = 25; // Default Pomodoro duration in minutes
  int _shortBreakTimer = 5; // Default short break duration in minutes
  int _longBreakTimer = 10; // Default long break duration in minutes

  int get pomodoroTimer => _pomodoroTimer;
  int get shortBreakTimer => _shortBreakTimer;
  int get longBreakTimer => _longBreakTimer;
  int get currentTimer => _currentTimer;



  void setCurrentTimer(int minutes) {
    _currentTimer = minutes;
    notifyListeners();
  }

  void setPomodoroTimer(int minutes) {
    _pomodoroTimer = minutes;
    notifyListeners();
    usePomodoroTimer();
  }

  void setShortBreakTimer(int minutes) {
    _shortBreakTimer = minutes;
    notifyListeners();
    useShortBreakTimer();
  }

  void setLongBreakTimer(int minutes) {
    _longBreakTimer = minutes;
    notifyListeners();
    useLongBreakTimer();
  }

  void usePomodoroTimer() {
    _currentTimer = _pomodoroTimer;
    notifyListeners();
  }

  void useShortBreakTimer() {
    _currentTimer = _shortBreakTimer;
    notifyListeners();
  }

  void useLongBreakTimer() {
    _currentTimer = _longBreakTimer;
    notifyListeners();
  }
}
