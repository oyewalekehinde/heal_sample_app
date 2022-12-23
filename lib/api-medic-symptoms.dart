class ApiMedicSymptoms {
  var iD;
  String? name;
  bool? isSelected = false;

  ApiMedicSymptoms({required this.iD,
    required this.name, this.isSelected});

  ApiMedicSymptoms.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    return data;
  }
  static List<ApiMedicSymptoms> fromJsonList(List<dynamic> _list) {
    return _list.map((_symptoms) => ApiMedicSymptoms.fromJson(_symptoms)).toList();
  }
}