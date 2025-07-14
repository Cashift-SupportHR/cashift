class SelectModel {
  final int? id;
  final String? name;
  final String? logo;

  SelectModel({this.id, this.name, this.logo});

  factory SelectModel.fromJson(Map<String, dynamic> json) {
    return SelectModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
    };
  }
}