import 'package:binary_app/features/business/presentation/bloc/businesses_event.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_feed_bloc.dart';
import 'package:binary_app/utils/extension_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorFeed extends StatelessWidget {
  const ErrorFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.strings.failedLoadBusinesses),
          TextButton(
            onPressed: () {
              context.read<BusinessesFeedBloc>().add(LoadBusinessesEvent());
            },
            child: Text(context.strings.tryAgain.toUpperCase()),
          )
        ],
      ),
    );
  }
}
