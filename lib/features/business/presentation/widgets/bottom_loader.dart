import 'package:binary_app/features/business/presentation/bloc/businesses_event.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_feed_bloc.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_feed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.watch<BusinessesFeedBloc>().state.status;

    return switch (status) {
      BusinessesFeedStatus.loading => const Padding(
          padding: EdgeInsets.all(12),
          child: Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(strokeWidth: 1.5),
            ),
          ),
        ),
      BusinessesFeedStatus.error => TextButton(
          onPressed: () {
            context.read<BusinessesFeedBloc>().add(LoadBusinessesEvent());
          },
          child: const Text('LOAD MORE'),
        ),
      BusinessesFeedStatus.success => const SizedBox(),
    };
  }
}
