import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BaseViewModel.dart';

abstract class BaseState<T extends StatefulWidget, V extends BaseViewModel>
    extends State<T> {
  // viewModel
  late V _viewModel;

  // 创建viewModel
  V createViewModel();

  // 构建子组件
  Widget buildWithViewModel(
    BuildContext context,
    Widget Function<R>({
      required R Function(V) selector,
      required Widget Function(BuildContext, R, Widget?) builder,
      Widget? child,
    }) builderWithSelector,
  );

  // 创建viewModel之后的钩子函数
  @protected
  void onCreatedViewModel() {}

  // provider的selector，用于监听某些字段的变化
  Widget builderWithSelector<R>({
    required R Function(V) selector,
    required Widget Function(BuildContext, R, Widget?) builder,
    Widget? child,
  }) {
    return Selector<V, R>(
      selector: (_, V vm) => selector(vm),
      builder: builder,
      child: child,
    );
  }

  @override
  void initState() {
    super.initState();
    _viewModel = createViewModel();
    onCreatedViewModel();
  }

  // 注入viewModel
  @override
  Widget build(BuildContext context) {
    return buildWithViewModel(context, builderWithSelector);
  }
}
