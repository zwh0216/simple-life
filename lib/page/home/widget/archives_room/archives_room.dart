import 'package:flutter/material.dart';
import 'package:simple_life/widget/drawer_page_wrap.dart';
import 'package:simple_life/widget/button_tab_bar.dart';

class ArchivesRoom extends StatefulWidget {
  const ArchivesRoom({super.key});

  @override
  State<ArchivesRoom> createState() => _ArchivesRoomState();
}

class _ArchivesRoomState extends State<ArchivesRoom> {
  String _selectedTabBarBtnKey = 'all';

  void onCreateItem() async {
    var res = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DrawerPageWrap(title: '新建事项', body: Text('弹窗'));
      },
    );
  }

  void onChangeTabBar(String key) {
    setState(() {
      _selectedTabBarBtnKey = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    final header = ButtonTabBar(
      currentActiveKey: _selectedTabBarBtnKey,
      onChange: onChangeTabBar,
      actions: [
        ButtonTabBarActionItem(label: '全部', key: 'all'),
        ButtonTabBarActionItem(label: '未完成', key: 'none'),
        ButtonTabBarActionItem(label: '已完成', key: 'done'),
      ],
    );

    final body = Scrollbar(
      child: ListView.separated(
        itemCount: 30,
        padding: EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return Text('项目$index-$_selectedTabBarBtnKey');
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.red);
        },
      ),
    );

    return SafeArea(child: Column(children: [header, Expanded(child: body)]));
  }
}
