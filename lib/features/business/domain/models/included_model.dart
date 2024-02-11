class IncludedModel {
  IncludedModel({
    required this.id,
    required this.type,
    required this.categoryType,
    this.name,
    this.description,
    this.slug,
    this.isApproved,
  });

  final String id, type, categoryType;
  final String? name, description, slug;
  final bool? isApproved;
}
