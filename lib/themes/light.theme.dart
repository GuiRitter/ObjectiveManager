import 'package:flutter/material.dart'
    show
        Brightness,
        BuildContext,
        Color,
        Colors,
        ColorScheme,
        MaterialColor,
        ThemeData;

ThemeData light({
  required BuildContext context,
}) =>
    ThemeData.light(
      useMaterial3: false,
    ).copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          const Color(
            0xFF595959, // WebAIM: white background, this foreground
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
          0xFFA88C00, // WebAIM: FAFAFA background, this foreground, Contrast Ratio 3 (Graphical Objects and User Interface Components)
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        cardColor: Colors.white,
        errorColor: const Color(
          0xFFB00020,
        ),
      ),
    );
