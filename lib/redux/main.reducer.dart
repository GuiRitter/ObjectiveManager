import 'package:flutter/material.dart' show BuildContext;
import 'package:objective_manager/models/models.import.dart' show StateModel;
import 'package:objective_manager/redux/theme.action.dart' show ThemeAction;
import 'package:objective_manager/utils/utils.import.dart' show logger;
import 'package:provider/provider.dart' show Provider;

final _log = logger('main.reducer');

dynamic Function(
  dynamic,
) getDispatch({
  required BuildContext context,
}) =>
    Provider.of<
        dynamic Function(
          dynamic,
        )>(
      context,
      listen: false,
    );

StateModel reducer(
  StateModel stateModel,
  dynamic action,
) {
  _log('reducer').asString('action', action.runtimeType).print();

  return {
    ThemeAction: () => stateModel.copyWith(
          themeMode: () => (action as ThemeAction).themeMode,
        ),
    NoAction: () => stateModel,
  }[action.runtimeType]!();
}

class NoAction {}
