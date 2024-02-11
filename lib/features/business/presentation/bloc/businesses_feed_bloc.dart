import 'dart:async';

import 'package:binary_app/features/business/domain/models/businesses_model.dart';
import 'package:binary_app/features/business/domain/models/data_model.dart';
import 'package:binary_app/features/business/domain/models/included_model.dart';
import 'package:binary_app/features/business/domain/models/result.dart';
import 'package:binary_app/features/business/domain/use_cases/get_businesses_use_case.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_event.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_feed_state.dart';
import 'package:binary_app/features/business/presentation/models/business.dart';
import 'package:binary_app/features/business/presentation/models/business_type.dart';
import 'package:binary_app/features/business/presentation/models/category.dart';
import 'package:binary_app/features/business/presentation/models/service_type.dart';
import 'package:binary_app/utils/bloc_transformers.dart';
import 'package:binary_app/utils/extension_bool.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _pageSize = 20;

class BusinessesFeedBloc extends Bloc<BusinessesEvent, BusinessesFeedState> {
  BusinessesFeedBloc(this.getBusinessByLocation)
      : super(const BusinessesFeedState.init()) {
    on<LoadBusinessesEvent>(loadBusinesses, transformer: throttleDroppable());
    on<FilterBusinessesEvent>(filter);
    on<ClearFilterEvent>(clearFilter);
  }

  final GetBusinessUseCase getBusinessByLocation;

  void filter(FilterBusinessesEvent event, Emitter<BusinessesFeedState> emit) {
    final filteredBusinesses = _applyFilter(state.allBusinesses, event.filter);
    emit(state.copyWith(
      selectedFilter: event.filter,
      filteredBusinesses: filteredBusinesses,
    ));

    add(LoadBusinessesEvent());
  }

  void clearFilter(ClearFilterEvent event, Emitter<BusinessesFeedState> emit) {
    emit(state.reset(
      selectedFilter: state.selectedFilter,
      filteredBusinesses: state.filteredBusinesses,
    ));
  }

  Future<void> loadBusinesses(
    LoadBusinessesEvent event,
    Emitter<BusinessesFeedState> emit,
  ) async {
    if (state.canLoadMore.not) return;

    emit(state.copyWith(status: BusinessesFeedStatus.loading));
    try {
      final result = await getBusinessByLocation(
        limit: _pageSize,
        offset: state.allBusinesses.length,
      );

      switch (result) {
        case ResultSuccess():
          _handleSuccessResult(result.data, emit);
        case ResultError():
          _handleErrorResult(result, emit);
      }
    } catch (_) {
      emit(state.copyWith(status: BusinessesFeedStatus.error));
    }
  }

  void _handleSuccessResult(
    BusinessesModel result,
    Emitter<BusinessesFeedState> emit,
  ) {
    final models = result.models;
    if (models.isEmpty) {
      emit(state.copyWith(
        status: BusinessesFeedStatus.success,
        canLoadMore: false,
      ));
    } else {
      final isAlreadyLoaded =
          result.offset == null || result.offset! < state.allBusinesses.length;
      if (isAlreadyLoaded) return;

      final currentFilters = state.filtersAsMap();
      final expandedFilters = _expandFilters(result.included, currentFilters);
      final newFilters = _convertFilterMapToList(expandedFilters);
      final newBusinesses = List.of(state.allBusinesses)
        ..addAll(_convertDataModelsToBusinesses(models));
      final filteredBusinesses = state.selectedFilter != null
          ? _applyFilter(newBusinesses, state.selectedFilter!)
          : <Business>[];

      emit(state.copyWith(
        status: BusinessesFeedStatus.success,
        allBusinesses: newBusinesses,
        filters: newFilters,
        filteredBusinesses: filteredBusinesses,
        canLoadMore: true,
      ));

      if (state.selectedFilter != null &&
          filteredBusinesses.length < _pageSize) {
        add(LoadBusinessesEvent());
      }
    }
  }

  void _handleErrorResult(
    ResultError result,
    Emitter<BusinessesFeedState> emit,
  ) {
    emit(state.copyWith(status: BusinessesFeedStatus.error));
  }

  Map<ServiceType, List<String>> _expandFilters(
    List<IncludedModel> includes,
    Map<ServiceType, List<String>> filter,
  ) {
    for (var o in includes) {
      final type = ServiceType(type: o.type, categoryType: o.categoryType);
      final ids = filter[type] ?? [];
      filter[type] = ids..add(o.id);
    }

    return filter;
  }

  List<BusinessType> _convertFilterMapToList(
    Map<ServiceType, List<String>> filterMap,
  ) {
    final filterList = <BusinessType>[];
    filterMap.forEach((key, value) {
      filterList.add(BusinessType(serviceType: key, ids: value));
    });

    return filterList;
  }

  List<Business> _convertDataModelsToBusinesses(List<DataModel> data) {
    return data
        .map((o) => Business(
            type: o.type,
            title: o.businessName,
            description: o.tagline,
            categories: o.serviceCategories
                ?.map((e) => Category(id: e.id, type: e.type))
                .toList()))
        .toList();
  }

  List<Business> _applyFilter(
    List<Business> businesses,
    BusinessType businessType,
  ) {
    return businesses
        .where((element) => _businessFilterCondition(element, businessType))
        .toList();
  }

  bool _businessFilterCondition(Business business, BusinessType businessType) {
    return _isAnyCategoryOfBusinessType(business.categories, businessType);
  }

  bool _isAnyCategoryOfBusinessType(
    List<Category>? categories,
    BusinessType businessType,
  ) {
    final categoryWithSameBusinessType = categories?.firstWhereOrNull((c) =>
        c.type == businessType.serviceType.type &&
        businessType.ids.contains(c.id));

    return categoryWithSameBusinessType != null;
  }
}
