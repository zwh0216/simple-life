import 'package:flutter/material.dart';

class DrawerPageWrap extends StatelessWidget {
  const DrawerPageWrap({
    super.key,
    required this.body,
    required this.title,
    this.height,
  });

  // 弹窗主体
  final Widget body;

  // 弹窗标题
  final String title;

  // 弹窗的高度
  final double? height;

  void onCancel(BuildContext context) {
    Navigator.of(context).pop(false);
  }

  // 弹窗标题
  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(child: Text(title)),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => onCancel(context),
              child: Text('取消'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // height: height,
      child: Column(
        children: [
          _buildHeader(context),
          const Divider(),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
