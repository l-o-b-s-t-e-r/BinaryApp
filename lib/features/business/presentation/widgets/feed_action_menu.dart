import 'package:binary_app/features/business/presentation/bloc/businesses_event.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_feed_bloc.dart';
import 'package:binary_app/features/business/presentation/models/business_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedActionMenu extends StatelessWidget {
  const FeedActionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<BusinessesFeedBloc>().state;
    return PopupMenuButton<BusinessType>(
      icon: const Icon(Icons.filter_alt),
      onSelected: (item) =>
          context.read<BusinessesFeedBloc>().add(FilterBusinessesEvent(item)),
      itemBuilder: (context) => state.filters
          .map(
            (o) => PopupMenuItem<BusinessType>(
              value: o,
              child: Text(o.serviceType.categoryType),
            ),
          )
          .toList(),
    );
  }
}
