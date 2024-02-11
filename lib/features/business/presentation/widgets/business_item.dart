import 'package:binary_app/features/business/presentation/models/business.dart';
import 'package:flutter/material.dart';

class BusinessItem extends StatelessWidget {
  const BusinessItem({required this.business, super.key});

  final Business business;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text(business.type ?? '', style: textTheme.bodySmall),
        title: Text(business.title ?? '', style: textTheme.labelLarge),
        isThreeLine: true,
        subtitle: Text(business.description ?? ''),
        dense: true,
      ),
    );
  }
}
