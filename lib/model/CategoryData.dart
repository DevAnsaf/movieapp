class CategoryData {
  CategoryData({
      this.id, 
      this.code, 
      this.name, 
      this.createdAt, 
      this.updatedAt,});

  CategoryData.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? code;
  String? name;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}