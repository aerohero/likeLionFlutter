import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void decrement() {
    if (_counter <= 0) return;
    _counter--;
    notifyListeners();
  }

  void increment() {
    _counter++;
    notifyListeners();
  }
}
