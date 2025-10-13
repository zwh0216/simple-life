import 'package:flutter/material.dart';

class DrawerPageWrap extends StatelessWidget {
  const DrawerPageWrap({super.key, required this.body, required this.title});

  final Widget body;

  final String title;

  void onCancel (BuildContext context) {
    Navigator.of(context).pop(false);
  }

  @override
  Widget build(BuildContext context) {
    // 弹窗标题
    final Widget header = Container(
      height: 80,
      padding: EdgeInsets.all(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(child: Text(title)),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: () => onCancel(context), child: Text('取消')),
          )
        ],
      ),
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
          children: [
            header,
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: body
              )
            )
          ]
      ),
    );
  }
}