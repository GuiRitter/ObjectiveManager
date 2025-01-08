import 'package:flutter/material.dart' show ThemeMode, ValueGetter;

class StateModel {
  final ThemeMode themeMode;

  StateModel({
    required this.themeMode,
  });

  StateModel copyWith({
    ValueGetter<ThemeMode>? themeMode,
  }) {
    final newThemeMode =
        (themeMode != null) ? themeMode.call() : this.themeMode;

    return StateModel(
      themeMode: newThemeMode,
    );
  }
}
