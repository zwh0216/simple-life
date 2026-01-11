import 'package:flutter/material.dart';

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
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '个人'),
      ],
      onTap: onPressedBtn,
    );
  }
}
