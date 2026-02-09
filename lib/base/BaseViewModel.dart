import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  // 页面加载状态
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // 设置页面的loading状态
  updateLoading (bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}