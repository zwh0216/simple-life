import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_life/core/base/BaseState.dart';
import '../view_model/home_view_model.dart';
import './task_page/task_page.dart';
import './calendar/calendar.dart';
import './statistics/statistics.dart';
import './account/account.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  BaseState<Home, HomeViewModel> createState() => _HomeState();
}

class _HomeState extends BaseState<Home, HomeViewModel> {
  // 底部导航栏的导航项
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      label: '日历',
      icon: Icon(Icons.calendar_month),
    ),
    const BottomNavigationBarItem(label: '任务', icon: Icon(Icons.home)),
    const BottomNavigationBarItem(label: '统计', icon: Icon(Icons.stadium)),
    const BottomNavigationBarItem(
      label: '个人',
      icon: Icon(Icons.account_circle),
    ),
  ];

  static const List<Widget> pages = [
    TaskPage(),
    Calendar(),
    StatisticsPage(),
    Account(),
  ];

  // 页面标题
  final List<String> titleList = ['日历', '任务', '统计', '个人'];

  @override
  HomeViewModel createViewModel() {
    return HomeViewModel();
  }

  @override
  Widget buildWithViewModel(
    BuildContext context,
    Widget Function<R>({
      required Widget Function(BuildContext p1, R p2, Widget? p3) builder,
      Widget? child,
      required R Function(HomeViewModel p1) selector,
    })
    builderWithSelector,
  ) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: _buildTitle()),
      bottomNavigationBar: _buildBottomNavBar(),
      body: builderWithSelector(
        selector: (HomeViewModel vm) => vm.currentTab,
        builder: (context, currentTab, _) {
          return IndexedStack(index: currentTab, children: pages);
        },
      ),
    );
  }

  // 页面标题
  Widget _buildTitle() {
    return builderWithSelector<int>(
      selector: (HomeViewModel vm) => vm.currentTab,
      builder: (context, currentTab, _) {
        return Text(titleList[currentTab]);
      },
    );
  }

  // 页面底部导航栏
  Widget _buildBottomNavBar() {
    return builderWithSelector<int>(
      selector: (HomeViewModel vm) => vm.currentTab,
      builder: (context, currentTab, _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: currentTab,
          items: bottomNavBarItems,
          onTap: (int index) {
            // context.read<HomeViewModel>().updateCurrentTab(index);
            Provider.of<HomeViewModel>(context, listen: false).updateCurrentTab(index);
          },
        );
      },
    );
  }
}
