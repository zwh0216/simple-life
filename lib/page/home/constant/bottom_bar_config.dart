import 'package:flutter/material.dart';
import 'package:simple_life/page/home/widget/account/account.dart';
import 'package:simple_life/page/home/widget/archives_room/archives_room.dart';

class BottomBarConfig {
  // 底部导航栏列表项
  static const List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
    BottomNavigationBarItem(label: '个人', icon: Icon(Icons.account_circle)),
  ];

  // 底部导航栏对应的页面
  static const List<Widget> pageList = [ArchivesRoom(), Account()];

  // 底部导航栏的文案
  static const titleList = [Text('首页'), Text('个人')];
}
