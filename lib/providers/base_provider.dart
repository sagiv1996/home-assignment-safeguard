import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _hasError = false;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  void setLoading(bool loading) {
    _isLoading = loading;
  }

  void setError(bool hasError) {
    _hasError = hasError;
  }
}
