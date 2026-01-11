import 'package:flutter/material.dart';
import 'package:simple_life/page/home/widget/custom_bottom_bar.dart';
import 'package:simple_life/page/home/widget/account/account.dart';
import 'package:simple_life/page/home/widget/archives_room/archives_room.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentTab;

  void onChangeTabKey(int index) {
    setState(() {
      currentTab = index;
    });
  }

  @override
  void initState() {
    currentTab = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      bottomNavigationBar: CustomBottomBar(
        currentTab: currentTab,
        onChangeTabKey: onChangeTabKey,
      ),
      body: IndexedStack(
        index: currentTab,
        children: [const ArchivesRoom(), const Account()],
      ),
    );
  }
}
