import 'package:binary_app/features/business/presentation/models/business.dart';
import 'package:binary_app/features/business/presentation/models/business_type.dart';
import 'package:binary_app/features/business/presentation/models/service_type.dart';

enum BusinessesFeedStatus {
  success,
  error,
  loading;

  bool get isLoading => this == loading;

  bool get isSuccess => this == success;

  bool get isError => this == error;
}

class BusinessesFeedState {
  final BusinessesFeedStatus status;
  final List<Business> allBusinesses;
  final List<Business> filteredBusinesses;
  final List<BusinessType> filters;
  final BusinessType? selectedFilter;
  final bool canLoadMore;

  List<Business> get visibleBusinesses =>
      selectedFilter == null ? allBusinesses : filteredBusinesses;

  const BusinessesFeedState.init() : this();

  const BusinessesFeedState({
    this.status = BusinessesFeedStatus.loading,
    this.allBusinesses = const [],
    this.filteredBusinesses = const [],
    this.filters = const [],
    this.selectedFilter,
    this.canLoadMore = true,
  });

  Map<ServiceType, List<String>> filtersAsMap() =>
      filters.asMap().map((_, value) => MapEntry(value.serviceType, value.ids));

  BusinessesFeedState copyWith({
    BusinessesFeedStatus? status,
    List<Business>? allBusinesses,
    List<Business>? filteredBusinesses,
    List<BusinessType>? filters,
    BusinessType? selectedFilter,
    bool? canLoadMore,
  }) {
    return BusinessesFeedState(
      status: status ?? this.status,
      allBusinesses: allBusinesses ?? this.allBusinesses,
      filteredBusinesses: filteredBusinesses ?? this.filteredBusinesses,
      filters: filters ?? this.filters,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }

  BusinessesFeedState reset({
    BusinessesFeedStatus? status,
    List<Business>? allBusinesses,
    List<Business>? filteredBusinesses,
    List<BusinessType>? filters,
    BusinessType? selectedFilter,
    bool? canLoadMore,
  }) {
    return BusinessesFeedState(
      status: status != null ? BusinessesFeedStatus.loading : this.status,
      allBusinesses: allBusinesses != null ? const [] : this.allBusinesses,
      filteredBusinesses:
          filteredBusinesses != null ? const [] : this.filteredBusinesses,
      filters: filters != null ? const [] : this.filters,
      selectedFilter: selectedFilter != null ? null : this.selectedFilter,
      canLoadMore: canLoadMore != null ? true : this.canLoadMore,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessesFeedState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          allBusinesses == other.allBusinesses &&
          filteredBusinesses == other.filteredBusinesses &&
          filters == other.filters &&
          selectedFilter == other.selectedFilter &&
          canLoadMore == other.canLoadMore;

  @override
  int get hashCode =>
      status.hashCode ^
      allBusinesses.hashCode ^
      filteredBusinesses.hashCode ^
      filters.hashCode ^
      selectedFilter.hashCode ^
      canLoadMore.hashCode;
}
