



import '../../export.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    final textColor = brightness == Brightness.dark ? Colors.white : primaryText;
    return ThemeData(
      brightness: brightness,
      canvasColor: background,
      cardColor: cardBackground ?? background,
      dividerColor: divider,
      fontFamily: 'Poppins',
      primarySwatch: createMaterialColor(accentColor),
      primaryColor: accentColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: accentColor,
        onPrimary: buttonText,
        secondary: accentColor,
        onSecondary: buttonText,
        surface: background,
        onSurface: primaryText,
        background: background,
        onBackground: primaryText,
        error: error,
        onError: buttonText,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardThemeData(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor.withOpacity(0.5),
        selectionHandleColor: accentColor.withOpacity(0.5),
        cursorColor: accentColor.withOpacity(0.5),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: brightness),
        color: background,
        toolbarTextStyle: TextStyle(
          color: primaryText,
          fontSize: 18.0,
        ),
        iconTheme: IconThemeData(color: primaryText, size: 25.0),
      ),
      iconTheme: IconThemeData(
        color: primaryText,
        size: 25.0,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          primaryContainer: accentColor,
          secondary: accentColor,
          secondaryContainer: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryText, width: 1.5),
        ),
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
          color: primaryText.withOpacity(0.5),
        ),
      ),
      unselectedWidgetColor: Colors.grey,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: textColor,
          fontSize: 24.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: textColor,
          fontSize: 20.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          color: textColor,
          fontSize: 18.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: textColor,
          fontSize: 20.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: textColor,
          fontSize: 18.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: textColor,
          fontSize: 16.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: textColor,
          fontSize: 15.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          color: textColor,
          fontSize: 14.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          color: textColor,
          fontSize: 13.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          fontSize: 13.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: textColor,
          fontSize: 12.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: textColor,
          fontSize: 11.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 16.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontSize: 15.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: textColor,
          fontSize: 14.0,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

// Helper function for MaterialColor
  static  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;
    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }


  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        background: Colors.white,
        cardBackground: Colors.white,
        primaryText: Colors.black,
        secondaryText: Colors.white,
        accentColor: Colors.black,
        divider: Colors.black,
        buttonBackground: Colors.black38,
        buttonText: Colors.white,
        disabled: Colors.black,
        error: Colors.red,
    
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        background: Colors.white,
        cardBackground: Colors.black,
        primaryText: Colors.white,
        secondaryText: Colors.black,
        accentColor: Colors.black,
        divider: Colors.black45,
        buttonBackground: Colors.white,
        buttonText: Colors.white,
        disabled: Colors.black,
        error: Colors.red,
    
      );
}
