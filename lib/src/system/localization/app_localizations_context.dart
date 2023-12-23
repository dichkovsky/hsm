import 'package:flutter/widgets.dart';
import 'package:hsm/l10n/generated/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}