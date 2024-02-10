import 'package:binary_app/presentation/business.dart';

enum BusinessesFeedStatus {
  success,
  error,
  initial;

  bool get isInitial => this == initial;

  bool get isSuccess => this == success;
}

class BusinessesFeedState {
  final BusinessesFeedStatus status;
  final List<Business> businesses;
  final bool canLoadMore;

  const BusinessesFeedState.init() : this();

  const BusinessesFeedState({
    this.status = BusinessesFeedStatus.initial,
    this.businesses = const [],
    this.canLoadMore = true,
  });

  BusinessesFeedState copyWith({
    BusinessesFeedStatus? status,
    List<Business>? businesses,
    bool? canLoadMore,
  }) {
    return BusinessesFeedState(
      status: status ?? this.status,
      businesses: businesses ?? this.businesses,
      canLoadMore: canLoadMore ?? this.canLoadMore,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessesFeedState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          businesses == other.businesses &&
          canLoadMore == other.canLoadMore;

  @override
  int get hashCode =>
      status.hashCode ^ businesses.hashCode ^ canLoadMore.hashCode;
}
