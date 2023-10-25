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

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color error;
  late Color warning;
  late Color info;
  late Color primaryBtnText;
  late Color lineColor;

  late Color rojouni;
  late Color rojo2;
  late Color rosa;
  late Color salmon;
  late Color blanco;
  late Color negro;
  late Color transparente;
  late Color univalle;

  TextStyle get title1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  TextStyle get displayLarge => GoogleFonts.getFont(
    'Outfit',
    color: primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 64,
  );
  TextStyle get displayMedium => GoogleFonts.getFont(
    'Outfit',
    color: primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 44,
  );
  TextStyle get displaySmall => GoogleFonts.getFont(
    'Outfit',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 36,
  );
  TextStyle get headlineLarge => GoogleFonts.getFont(
    'Outfit',
    color: primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 32,
  );
  TextStyle get headlineMedium => GoogleFonts.getFont(
    'Outfit',
    color: primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 24,
  );
  TextStyle get headlineSmall => GoogleFonts.getFont(
    'Outfit',
    color: primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );
  TextStyle get titleLarge => GoogleFonts.getFont(
    'Outfit',
    color: primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );
  TextStyle get titleMedium => GoogleFonts.getFont(
    'Readex Pro',
    color: info,
    fontWeight: FontWeight.normal,
    fontSize: 18,
  );
  TextStyle get titleSmall => GoogleFonts.getFont(
    'Readex Pro',
    color: info,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
  TextStyle get labelLarge => GoogleFonts.getFont(
    'Readex Pro',
    color: secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
  TextStyle get labelMedium => GoogleFonts.getFont(
    'Readex Pro',
    color: secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  TextStyle get labelSmall => GoogleFonts.getFont(
    'Readex Pro',
    color: secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
  TextStyle get bodyLarge => GoogleFonts.getFont(
    'Readex Pro',
    color: primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
  TextStyle get bodyMedium => GoogleFonts.getFont(
    'Readex Pro',
    color: primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );
  TextStyle get bodySmall => GoogleFonts.getFont(
    'Readex Pro',
    color: primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primary = const Color(0xFF4B39EF);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFDFE2E6);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF101213);
  late Color secondaryText = const Color(0xFF57636C);
  late Color accent1 = const Color(0xFF24225A);
  late Color accent2 = const Color(0xFF1F504D);
  late Color accent3 = const Color(0xFF563B30);
  late Color accent4 = const Color(0xFFCFD0D0);
  late Color success = const Color(0xFF249588);
  late Color error = const Color(0xFFFD5963);
  late Color warning = const Color(0xFFF8CE58);
  late Color info = const Color(0xFFFDFDFD);
  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFE0E3E7);

  late Color rojouni = Color(0xFF440D20);
  late Color rojo2 = Color(0xFF592133);
  late Color rosa = Color(0xFF88515D);
  late Color salmon = Color(0xFFDEBBC5);
  late Color blanco = Color(0xFFF6E9EE);
  late Color negro = Color(0xFF000101);
  late Color transparente = Color(0x0);
  late Color univalle = Color(0xFF840842);
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF4B39EF);
  late Color secondaryColor = const Color(0xFF39D2C0);
  late Color tertiaryColor = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFFF5963);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF101213);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFF22282F);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
