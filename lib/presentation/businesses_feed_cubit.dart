import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/models/result.dart';
import 'package:binary_app/domain/use_cases/get_businesses_use_case.dart';
import 'package:binary_app/presentation/business.dart';
import 'package:binary_app/presentation/businesses_feed_state.dart';
import 'package:binary_app/utils/extension_bool.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessesFeedCubit extends Cubit<BusinessesFeedState> {
  BusinessesFeedCubit(this.getBusinessByLocation)
      : super(const BusinessesFeedState.init());

  final GetBusinessUseCase getBusinessByLocation;

  Future<void> loadBusinesses() async {
    if (state.canLoadMore.not) return;
    await Future.delayed(const Duration(seconds: 2)); //TODO remove
    try {
      final Result result;
      if (state.status.isInitial) {
        result = await getBusinessByLocation(offset: 0);
      } else {
        result = await getBusinessByLocation(offset: state.businesses.length);
      }

      switch (result) {
        case ResultSuccess():
          _handleSuccessResult(result.data);
        case ResultError():
          _handleErrorResult(result);
      }
    } catch (_) {}
  }

  void _handleSuccessResult(BusinessesModel result) {
    final models = result.models;
    if (models == null || models.isEmpty) {
      emit(state.copyWith(canLoadMore: false));
    } else {
      final businesses = models
          .map((o) => Business(
                type: o.type,
                title: o.businessName,
                description: o.tagline,
              ))
          .toList();

      emit(state.copyWith(
        status: BusinessesFeedStatus.success,
        businesses: List.of(state.businesses)..addAll(businesses),
        canLoadMore: true,
      ));
    }
  }

  void _handleErrorResult(ResultError result) {
    emit(state.copyWith(status: BusinessesFeedStatus.error));
  }
}
