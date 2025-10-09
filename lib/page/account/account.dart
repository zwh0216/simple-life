import 'package:flutter/material.dart';
import 'package:simple_life/widget/tab_bar.dart';


class Myself extends StatelessWidget {
  const Myself({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('个人'), centerTitle: true),
      bottomNavigationBar: CustomTabBar(tabKey: 'account',),
      body: Text('this is account Page')
    );

  }
}
