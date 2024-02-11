import 'package:binary_app/features/business/presentation/models/service_type.dart';

class BusinessType {
  BusinessType({
    required this.serviceType,
    required this.ids,
  });

  final ServiceType serviceType;
  final List<String> ids;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessType &&
          runtimeType == other.runtimeType &&
          serviceType == other.serviceType &&
          ids == other.ids;

  @override
  int get hashCode => serviceType.hashCode ^ ids.hashCode;
}
