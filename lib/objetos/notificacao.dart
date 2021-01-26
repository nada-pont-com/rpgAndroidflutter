import 'package:flutter/material.dart';

class SingleNotifier extends ChangeNotifier {
  int _currentIndex = 0;
  SingleNotifier();
  int get currentIndex => _currentIndex;
  updateCountry(int value) {
    if (value != _currentIndex) {
      _currentIndex = value;
      notifyListeners();
    }
  }
}
