import 'package:flutter/material.dart'
    show
        BuildContext,
        ColorScheme,
        Colors,
        Locale,
        MaterialApp,
        StatelessWidget,
        ThemeData,
        ValueNotifier,
        Widget,
        runApp;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:objective_manager/common/settings.dart'
    show Settings, l10nNotifier, navigatorState, snackState;
import 'package:objective_manager/ui/pages/home.page.dart' show MyHomePage;

void main() {
  runApp(
    const MyApp(),
  );
}

/// value notifier for the count
final ValueNotifier<int> counter = ValueNotifier<int>(
  0,
);

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Objective Manager',
      onGenerateTitle: getTitleLocalized,
      localeResolutionCallback: populateL10nNotifier,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // TODO implement l10n switching
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorKey: navigatorState,
      scaffoldMessengerKey: snackState,
      home: const MyHomePage(
        title: 'Objective Manager',
      ),
    );
  }

  String getTitleLocalized(
    context,
  ) {
    final l10n = AppLocalizations.of(
      context,
    )!;

    return l10n.title;
  }

  Locale? populateL10nNotifier(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    AppLocalizations.delegate
        .load(
      locale!,
    )
        .then(
      (
        l10n,
      ) {
        Settings.locale = locale.toString();

        return l10nNotifier.value = l10n;
      },
    );

    return null;
  }
}
