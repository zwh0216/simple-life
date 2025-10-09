import 'package:flutter/material.dart';
import 'package:simple_life/widget/tab_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState () => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('首页'), centerTitle: true),
        bottomNavigationBar: CustomTabBar(tabKey: 'home',),
        body: Text('this is home Page')
    );
  }
}