class ServiceType {
  ServiceType({
    required this.type,
    required this.categoryType,
  });

  final String type, categoryType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceType &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          categoryType == other.categoryType;

  @override
  int get hashCode => type.hashCode ^ categoryType.hashCode;
}
