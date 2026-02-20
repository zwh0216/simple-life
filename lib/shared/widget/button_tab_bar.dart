import 'package:flutter/material.dart';

class ButtonTabBarActionItem {
  const ButtonTabBarActionItem({required this.label, required this.key});

  final String label;

  final String key;
}

class ButtonTabBar extends StatefulWidget {
  const ButtonTabBar({
    super.key,
    required this.actions,
    required this.onChange,
    required this.currentActiveKey
  });

  final List<ButtonTabBarActionItem> actions;

  final String currentActiveKey;

  final Function onChange;

  @override
  State<ButtonTabBar> createState() {
    return _ButtonTabBar();
  }
}

class _ButtonTabBar extends State<ButtonTabBar>{
  late String _currentActiveKey;

  @override
  void initState() {
    _currentActiveKey = widget.currentActiveKey;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ButtonTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(oldWidget.currentActiveKey != widget.currentActiveKey){
      setState(() {
        _currentActiveKey = widget.currentActiveKey;
      });
    }
  }

  ButtonStyle? getButtonStyle (item) {
    return _currentActiveKey == item.key
      ? ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue))
      : null;
  }

  Widget renderBtnLabel (item) {
    return Text(
      item.label,
      style: _currentActiveKey == item.key ? TextStyle(color: Colors.white) : null
    );
  }

  void onSelected (String key) {
    widget.onChange(key);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 8,
      children: widget.actions.map((item) =>  TextButton(
        onPressed: () => onSelected(item.key),
        style: getButtonStyle(item),
        child: renderBtnLabel(item),
      )).toList()
    );
  }
}