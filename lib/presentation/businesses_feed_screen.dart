import 'package:binary_app/domain/use_cases/get_businesses_use_case.dart';
import 'package:binary_app/presentation/business.dart';
import 'package:binary_app/presentation/businesses_feed_cubit.dart';
import 'package:binary_app/presentation/businesses_feed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessesFeedScreen extends StatelessWidget {
  const BusinessesFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Businesses'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocProvider(
        create: (context) =>
            BusinessesFeedCubit(context.read<GetBusinessUseCase>())
              ..loadBusinesses(),
        child: const BusinessesFeedContent(),
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
    return Column(
      children: [
        TextButton(
          child: Text('LOAD'),
          onPressed: () {
            context.read<BusinessesFeedCubit>().loadBusinesses();
          },
        ),
        Expanded(
          child: BlocBuilder<BusinessesFeedCubit, BusinessesFeedState>(
            builder: (context, state) {
              switch (state.status) {
                case BusinessesFeedStatus.success:
                  if (state.businesses.isEmpty) {
                    return const Center(child: Text('No businesses =('));
                  }
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.canLoadMore
                        ? state.businesses.length + 1
                        : state.businesses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return index >= state.businesses.length
                          ? const BottomLoader()
                          : BusinessItem(business: state.businesses[index]);
                    },
                  );
                case BusinessesFeedStatus.error:
                  return const Center(
                      child: Text('Ups, something went wrong =('));
                case BusinessesFeedStatus.initial:
                  return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<BusinessesFeedCubit>().loadBusinesses();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}

class BusinessItem extends StatelessWidget {
  const BusinessItem({required this.business, super.key});

  final Business business;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text(business.type ?? '', style: textTheme.bodySmall),
        title: Text(business.title ?? ''),
        isThreeLine: true,
        subtitle: Text(business.description ?? ''),
        dense: true,
      ),
    );
  }
}
