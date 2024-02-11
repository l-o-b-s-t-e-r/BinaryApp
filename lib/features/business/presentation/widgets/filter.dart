import 'package:binary_app/features/business/presentation/bloc/businesses_event.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_feed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final filter = context
        .select((BusinessesFeedBloc value) => value.state.selectedFilter);
    final filterName = filter?.serviceType.categoryType;

    return Visibility(
      visible: filterName != null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: colorTheme.primary,
            ),
            child: Text(
              filterName ?? '',
              style:
                  textTheme.labelLarge?.copyWith(color: colorTheme.onPrimary),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              context.read<BusinessesFeedBloc>().add(ClearFilterEvent());
            },
          )
        ],
      ),
    );
  }
}
