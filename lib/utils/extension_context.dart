import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExt on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}
