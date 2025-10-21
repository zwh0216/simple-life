import 'package:flutter/cupertino.dart';

class Cell extends StatefulWidget {
  const Cell({
    super.key,
    required this.width,
    required this.height,
    required this.left,
    this.center,
    this.right,
  });

  final double width;

  final double height;

  final Widget left;

  final Widget? center;

  final Widget? right;

  @override
  State<Cell> createState() {
    return _Cell();
  }
}

class _Cell extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [widget.left];

    if (widget.center != null) {
      children.add(Expanded(child: widget.center!));
    }

    if (widget.right != null) {
      children.add(widget.right!);
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      padding: EdgeInsets.all(8),
      child: Row(children: children),
    );
  }
}
