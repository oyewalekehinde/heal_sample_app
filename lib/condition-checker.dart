class ConditionChecker {
  String? id;
  String? label;
  bool? isSelected;

  ConditionChecker({required this.id, required this.label, required this.isSelected});

  ConditionChecker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    return data;
  }

  static List<ConditionChecker> fromJsonList(List<dynamic> _list) {
    return _list.map((_data) => ConditionChecker.fromJson(_data)).toList();
  }
}