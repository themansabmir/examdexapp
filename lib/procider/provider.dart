import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  final List<String> _digits = List.filled(6, '');

  bool _isVerifying = false;
  String? _error;

  bool get isVerifying => _isVerifying;
  String? get error => _error;

  void setDigit(int index, String value) {
    _digits[index] = value;
    notifyListeners();
  }

  String get otp => _digits.join();
  bool get isComplete => _digits.every((d) => d.isNotEmpty);

  void setVerifying(bool value) {
    _isVerifying = value;
    notifyListeners();
  }

  void setError(String? message) {
    _error = message;
    notifyListeners();
  }

  void clear() {
    for (int i = 0; i < _digits.length; i++) {
      _digits[i] = '';
    }
    _error = null;
    notifyListeners();
  }
}
