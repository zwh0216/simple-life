import 'package:flutter/material.dart';
import 'package:simple_life/widget/common/cell.dart';

class ScheduleItemCell extends StatefulWidget {
  const ScheduleItemCell({
    super.key,
    required this.width,
    required this.title,
    this.content,
  });

  final double width;

  final Widget title;

  final Widget? content;

  @override
  State<ScheduleItemCell> createState() => _ScheduleItemCellState();
}

class _ScheduleItemCellState extends State<ScheduleItemCell> {
  @override
  Widget build(BuildContext context) {
    return Cell(
      width: widget.width,
      height: 80,
      left: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [widget.title, if (widget.content != null) widget.content!],
      ),
    );
  }
}
