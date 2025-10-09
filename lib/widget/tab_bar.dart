import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTabBar extends StatefulWidget {

  const CustomTabBar({super.key, required this.tabKey});

  final String tabKey;

  @override
  State<CustomTabBar> createState() {
    return _CustomTabBar();
  }
}

class _CustomTabBar extends State<CustomTabBar> {
  late int currentTab;

  @override
  void initState() {
    currentTab = widget.tabKey == 'home' ? 0 : 1;
    super.initState();
  }

  void onPressedBtn (int index) {
    print('index -> $index');
    setState(() {
      currentTab = index;
      print('currentTab -> $currentTab');
    });
    index == 0 ? context.goNamed('home') : context.goNamed('account');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentTab,
      selectedItemColor: Colors.red,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: '个人'),
      ],
      onTap: onPressedBtn,
    );
  }
}