import 'dart:async' show FutureOr;

import 'package:flutter/material.dart'
    show
        BuildContext,
        Locale,
        MaterialApp,
        StatelessWidget,
        ThemeMode,
        ValueNotifier,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:flutter/services.dart'
    show Color, SystemChrome, SystemUiOverlayStyle;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_redux/flutter_redux.dart'
    show StoreConnector, StoreProvider;
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;
import 'package:objective_manager/common/common.import.dart'
    show appNamePlaceHolder, l10nNotifier, navigatorState, Settings, snackState;
import 'package:objective_manager/models/models.import.dart' show StateModel;
import 'package:objective_manager/redux/main.reducer.dart' show reducer;
import 'package:objective_manager/themes/themes.import.dart' show dark, light;
import 'package:objective_manager/ui/pages/home.page.dart' show MyHomePage;
import 'package:objective_manager/utils/utils.import.dart' show logger;
import 'package:provider/provider.dart' show MultiProvider, Provider;
import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show thunkMiddleware;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // https://stackoverflow.com/questions/52489458/how-to-change-status-bar-color-in-flutter
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(
        0xFFFFdd09,
      ),
    ),
  );

  SharedPreferences.getInstance().then(
    initializeApp,
  );
}

/// value notifier for the count
final ValueNotifier<int> counter = ValueNotifier<int>(
  0,
);

final _log = logger('main');

FutureOr initializeApp(
  SharedPreferences prefs,
) async {
  final themeName = prefs.getString(
    Settings.themeKey,
  );

  await initializeDateFormatting(
    "en",
  );

  _log('initializeApp').raw('theme', themeName).print();

  final theme = (themeName?.isNotEmpty ?? false)
      ? ThemeMode.values.byName(
          themeName!,
        )
      : ThemeMode.system;

  final store = Store<StateModel>(
    reducer,
    initialState: StateModel(
      themeMode: theme,
    ),
    middleware: [
      thunkMiddleware,
    ],
  );

  runApp(
    MyApp(
      store: store,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Store<StateModel> store;

  const MyApp({
    super.key,
    required this.store,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    _log('build').print();

    final dispatch = store.dispatch;

    final themeLight = light(
      context: context,
    );

    final themeDark = dark(
      context: context,
    );

    return MultiProvider(
      providers: [
        Provider<
            dynamic Function(
              dynamic,
            )>.value(
          value: dispatch,
        ),
      ],
      child: StoreProvider<StateModel>(
        store: store,
        child: StoreConnector<StateModel, ThemeMode>(
          distinct: true,
          converter: (
            store,
          ) =>
              store.state.themeMode,
          builder: (
            context,
            themeMode,
          ) =>
              MaterialApp(
            title: appNamePlaceHolder,
            onGenerateTitle: getTitleLocalized,
            localeResolutionCallback: populateL10nNotifier,
            theme: themeLight,
            darkTheme: themeDark,
            themeMode: themeMode,
            home: const MyHomePage(
              title: 'Objective Manager',
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            // TODO implement l10n switching
            supportedLocales: AppLocalizations.supportedLocales,
            navigatorKey: navigatorState,
            scaffoldMessengerKey: snackState,
          ),
        ),
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
