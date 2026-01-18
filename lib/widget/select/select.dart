import 'package:flutter/material.dart';
import 'package:simple_life/widget/drawer_page_wrap.dart';
import './model/select_option_model.dart';

class Select extends StatelessWidget {
  const Select({
    super.key,
    required this.selectedKey,
    required this.options,
    required this.onChange,
  });

  // 当前选中项的key
  final String selectedKey;

  // 所有选项
  final List<SelectOptionModel> options;

  // 修改当前选中选项
  final void Function(String, SelectOptionModel) onChange;

  // 选中某个选项
  void onSelectItem(BuildContext context, int index) {
    final item = options[index];
    onChange(item.key, item);
    Navigator.of(context).pop(false);
  }

  // 显示隐藏组件所有选项的弹窗
  void openBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DrawerPageWrap(
          title: '选择',
          body: Expanded(
            child: ListView.builder(
              itemBuilder: (_, int index) {
                final SelectOptionModel item = options[index];
                return ListTile(
                  title: Center(child: Text(item.label)),
                  onTap: () => onSelectItem(context, index),
                );
              },
              itemCount: options.length,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, SelectOptionModel> optionsMap = {
      for (SelectOptionModel item in options) item.key: item,
    };
    final String label = optionsMap[selectedKey]?.label ?? '';

    return InkWell(
      onTap: () => openBottomModal(context),
      child: Container(
        color: Colors.transparent,
        child: Row(children: [Text(label), Icon(Icons.expand_circle_down)]),
      ),
    );
  }
}
