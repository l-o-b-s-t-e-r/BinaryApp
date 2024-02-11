import 'package:binary_app/features/business/domain/use_cases/get_businesses_use_case.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_event.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_feed_bloc.dart';
import 'package:binary_app/features/business/presentation/bloc/businesses_feed_state.dart';
import 'package:binary_app/features/business/presentation/widgets/bottom_loader.dart';
import 'package:binary_app/features/business/presentation/widgets/business_item.dart';
import 'package:binary_app/features/business/presentation/widgets/empty_feed.dart';
import 'package:binary_app/features/business/presentation/widgets/error_feed.dart';
import 'package:binary_app/features/business/presentation/widgets/feed_action_menu.dart';
import 'package:binary_app/features/business/presentation/widgets/filter.dart';
import 'package:binary_app/utils/extension_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessesFeedScreen extends StatelessWidget {
  const BusinessesFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return BusinessesFeedBloc(context.read<GetBusinessUseCase>())
          ..add(LoadBusinessesEvent());
      },
      child: BlocConsumer<BusinessesFeedBloc, BusinessesFeedState>(
        listener: (context, state) {
          if (state.status.isError && state.allBusinesses.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.strings.failedLoadBusinesses)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.strings.businesses),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions:
                  state.filters.isNotEmpty ? [const FeedActionMenu()] : null,
            ),
            body: const BusinessesFeedContent(),
          );
        },
      ),
    );
  }
}

class BusinessesFeedContent extends StatefulWidget {
  const BusinessesFeedContent({super.key});

  @override
  State<BusinessesFeedContent> createState() => _BusinessesFeedContentState();
}

class _BusinessesFeedContentState extends State<BusinessesFeedContent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BusinessesFeedBloc>().state;
    if (state.status.isLoading && state.allBusinesses.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.status.isError && state.allBusinesses.isEmpty) {
      return const ErrorFeed();
    } else if (state.allBusinesses.isEmpty) {
      return const EmptyFeed();
    } else {
      return Column(
        children: [
          const Filter(),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.canLoadMore
                  ? state.visibleBusinesses.length + 1
                  : state.visibleBusinesses.length,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.visibleBusinesses.length
                    ? const BottomLoader()
                    : BusinessItem(business: state.visibleBusinesses[index]);
              },
            ),
          ),
        ],
      );
    }
    ;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<BusinessesFeedBloc>().add(LoadBusinessesEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
