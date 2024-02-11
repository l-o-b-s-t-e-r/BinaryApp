import 'package:binary_app/features/business/presentation/models/business_type.dart';

sealed class BusinessesEvent {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessesEvent && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

final class LoadBusinessesEvent extends BusinessesEvent {}

final class ClearFilterEvent extends BusinessesEvent {}

final class FilterBusinessesEvent extends BusinessesEvent {
  FilterBusinessesEvent(this.filter);

  final BusinessType filter;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterBusinessesEvent &&
          runtimeType == other.runtimeType &&
          filter == other.filter;

  @override
  int get hashCode => filter.hashCode;
}
