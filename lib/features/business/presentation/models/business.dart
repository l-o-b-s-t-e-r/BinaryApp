import 'package:binary_app/features/business/presentation/models/category.dart';

class Business {
  Business({this.type, this.title, this.description, this.categories});

  final String? type, title, description;
  final List<Category>? categories;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Business &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          title == other.title &&
          description == other.description &&
          categories == other.categories;

  @override
  int get hashCode =>
      type.hashCode ^
      title.hashCode ^
      description.hashCode ^
      categories.hashCode;
}
