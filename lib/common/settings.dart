import 'package:flutter/material.dart'
    show
        GlobalKey,
        Locale,
        NavigatorState,
        ScaffoldMessengerState,
        ValueNotifier;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

const appName = 'objective_manager';
const appNamePlaceHolder = 'Objective Manager';

final l10nNotifier = ValueNotifier<AppLocalizations?>(
  null,
);

final navigatorState = GlobalKey<NavigatorState>();

final snackState = GlobalKey<ScaffoldMessengerState>();

AppLocalizations get l10n => l10nNotifier.value!;

class Settings {
  static String locale = const Locale.fromSubtags(
    languageCode: "en",
  ).toString();

  static const themeKey = 'theme';
}
