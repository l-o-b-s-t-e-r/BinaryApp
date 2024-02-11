import 'package:binary_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

extension ContextExt on BuildContext {
  S get strings => S.of(this);
}
