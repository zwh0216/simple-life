import 'package:simple_life/core/base/BaseViewModel.dart';
import '../model/BottomNavBarItem.dart';

class HomeViewModel extends BaseViewModel {
  // 目前展示的tabBar页面的index
  int _currentTab = 0;

  int get currentTab => _currentTab;

  // 更新当前的展示页面index
  void updateCurrentTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}