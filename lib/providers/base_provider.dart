import 'package:flutter/material.dart';
import 'package:safeguard_home_assignment/providers/interfaces/base_provider_interface.dart';

class BaseProvider extends ChangeNotifier implements BaseProviderInterface {
  bool _isLoading = false;
  bool _hasError = false;

  @override
  bool get isLoading => _isLoading;

  @override
  bool get hasError => _hasError;

  @override
  void setHasError(bool hasError) {
    _hasError = hasError;
  }

  @override
  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
  }
}
