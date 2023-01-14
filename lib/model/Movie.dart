import 'Category.dart';

class Movie {
  Movie({
      this.id, 
      this.name, 
      this.imageUrl, 
      this.streamUrl, 
      this.category, 
      this.description, 
      this.rating, 
      this.type, 
      this.createdAt, 
      this.updatedAt,});

  Movie.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    streamUrl = json['streamUrl'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    description = json['description'];
    rating = json['rating'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? name;
  String? imageUrl;
  String? streamUrl;
  Category? category;
  String? description;
  String? rating;
  String? type;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['imageUrl'] = imageUrl;
    map['streamUrl'] = streamUrl;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['description'] = description;
    map['rating'] = rating;
    map['type'] = type;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}