import 'package:flutter/material.dart';
import 'package:simple_life/page/home/constant/bottom_bar_config.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.currentTab,
    required this.onChangeTabKey,
  });

  // 当前激活的底部导航栏按钮
  final int currentTab;

  // 更新激活的底部导航栏按钮
  final void Function(int) onChangeTabKey;

  void onPressedBtn(int index) {
    onChangeTabKey(index);
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: currentTab,
      selectedItemColor: Colors.red,
      items: BottomBarConfig.bottomNavBarItems,
      onTap: onPressedBtn,
    );
  }
}
