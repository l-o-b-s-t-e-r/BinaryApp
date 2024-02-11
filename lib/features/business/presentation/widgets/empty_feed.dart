import 'package:binary_app/utils/extension_context.dart';
import 'package:flutter/widgets.dart';

class EmptyFeed extends StatelessWidget {
  const EmptyFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.strings.emptyBusinessesList),
    );
  }
}
