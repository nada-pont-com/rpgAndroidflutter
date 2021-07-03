import 'package:flutter/material.dart';

class SingleNotifier extends ChangeNotifier {
  SingleNotifier();

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateCountry(int? value) {
    if (value != _currentIndex) {
      _currentIndex = value!;
      print(hasListeners);
      notifyListeners();
    }
  }
}
