// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color mossGreen;
  late Color dun;
  late Color alabaster;
  late Color coyote;
  late Color jet;
  late Color licorice;
  late Color spaceCadet;
  late Color vanDyke;
  late Color dimGray;
  late Color sage;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF8C8A87);
  late Color secondary = const Color(0xFFBC915C);
  late Color tertiary = const Color(0xFF230A06);
  late Color alternate = const Color(0xFF65635B);
  late Color primaryText = const Color(0xFF2E2C2D);
  late Color secondaryText = const Color(0xFFF9F7F4);
  late Color primaryBackground = const Color(0xFFFFF8F2);
  late Color secondaryBackground = const Color(0xFFCABDAA);
  late Color accent1 = const Color(0xFFB3A99D);
  late Color accent2 = const Color(0xFFD6C4B0);
  late Color accent3 = const Color(0xFFBFAF8B);
  late Color accent4 = const Color(0xFFA76D5D);
  late Color success = const Color(0xFFA4C8A0);
  late Color warning = const Color(0xFFE4C65A);
  late Color error = const Color(0xFFD76D6D);
  late Color info = const Color(0xFFA2C8DB);

  late Color mossGreen = Color(0xFF9F9056);
  late Color dun = Color(0xFFCABDAA);
  late Color alabaster = Color(0xFFE4E0D4);
  late Color coyote = Color(0xFF805D3D);
  late Color jet = Color(0xFF2E2C2D);
  late Color licorice = Color(0xFF230A06);
  late Color spaceCadet = Color(0xFF181730);
  late Color vanDyke = Color(0xFF3E3128);
  late Color dimGray = Color(0xFF65635B);
  late Color sage = Color(0xFFBBB58B);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Forum';
  TextStyle get displayLarge => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Forum';
  TextStyle get displayMedium => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Forum';
  TextStyle get displaySmall => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Forum';
  TextStyle get headlineLarge => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Forum';
  TextStyle get headlineMedium => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Forum';
  TextStyle get headlineSmall => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Forum';
  TextStyle get titleLarge => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Forum';
  TextStyle get titleMedium => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Forum';
  TextStyle get titleSmall => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Forum';
  TextStyle get labelLarge => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Forum';
  TextStyle get labelMedium => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Forum';
  TextStyle get labelSmall => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Forum';
  TextStyle get bodyLarge => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Forum';
  TextStyle get bodyMedium => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.w900,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Forum';
  TextStyle get bodySmall => GoogleFonts.forum(
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF8C8A87);
  late Color secondary = const Color(0xFFBC915C);
  late Color tertiary = const Color(0xFF230A06);
  late Color alternate = const Color(0xFF65635B);
  late Color primaryText = const Color(0xFF2E2C2D);
  late Color secondaryText = const Color(0xFFF9F7F4);
  late Color primaryBackground = const Color(0xFFFFF8F2);
  late Color secondaryBackground = const Color(0xFFCABDAA);
  late Color accent1 = const Color(0xFF8F7B70);
  late Color accent2 = const Color(0xFFB79C7A);
  late Color accent3 = const Color(0xFFA78C6A);
  late Color accent4 = const Color(0xFF7A4C3A);
  late Color success = const Color(0xFF6A9B60);
  late Color warning = const Color(0xFFC9A430);
  late Color error = const Color(0xFFA44B4B);
  late Color info = const Color(0xFFFFFFFF);

  late Color mossGreen = Color(0xFF9F9056);
  late Color dun = Color(0xFFCABDAA);
  late Color alabaster = Color(0xFFE4E0D4);
  late Color coyote = Color(0xFF805D3D);
  late Color jet = Color(0xFF2E2C2D);
  late Color licorice = Color(0xFF230A06);
  late Color spaceCadet = Color(0xFF181730);
  late Color vanDyke = Color(0xFF3E3128);
  late Color dimGray = Color(0xFF65635B);
  late Color sage = Color(0xFFBBB58B);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
