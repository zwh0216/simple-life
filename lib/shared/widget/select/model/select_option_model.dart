class SelectOptionModel {
  const SelectOptionModel({required this.label, required this.key});

  // select组件的项的key
  final String key;

  // select组件的单项数据的文案
  final String label;

  @override
  String toString() {
    return '{key: $key, label: $label}';
  }
}
