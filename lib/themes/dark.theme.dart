import 'package:flutter/material.dart'
    show
        AppBarTheme,
        Brightness,
        BuildContext,
        Color,
        ColorScheme,
        MaterialColor,
        ThemeData;

ThemeData dark({
  required BuildContext context,
}) =>
    ThemeData.dark(
      useMaterial3: false,
    ).copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          const Color(
            0xFFD8D8D8, // WebAIM: 424242 background, this foreground
          ).value,
          const {
            50: Color(
              0xFFf9f9f9,
            ),
            100: Color(
              0xFFf2f2f2,
            ),
            200: Color(
              0xFFe9e9e9,
            ),
            300: Color(
              0xFFd9d9d9,
            ),
            400: Color(
              0xFFb5b5b5,
            ),
            500: Color(
              0xFF959595,
            ),
            600: Color(
              0xFF6d6d6d,
            ),
            700: Color(
              0xFF595959,
            ),
            800: Color(
              0xFF3b3b3b,
            ),
            900: Color(
              0xFF1a1a1a,
            ),
          },
        ),
        accentColor: const Color(
          0xFFffde09, // WebAIM: 303030 background, this foreground, Contrast Ratio 3 (Graphical Objects and User Interface Components)
        ),
        backgroundColor: const Color(
          0xFF121212,
        ),
        brightness: Brightness.dark,
        cardColor: const Color(
          0xFF121212,
        ),
        errorColor: const Color(
          0xFFCF6679,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Color(
          0xFF595959, // WebAIM: this background, white foreground
        ),
      ),
    );
