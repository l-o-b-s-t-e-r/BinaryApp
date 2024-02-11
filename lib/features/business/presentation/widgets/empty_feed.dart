import 'package:flutter/widgets.dart';

class EmptyFeed extends StatelessWidget {
  const EmptyFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('The list of businesses is empty'),
    );
  }
}
