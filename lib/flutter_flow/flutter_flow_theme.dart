// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {

  static FlutterFlowTheme of(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    return LightModeTheme();
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
  late Color accent5;
  late Color black1;
  late Color tertiary1;
  late Color tertiary2;
  late Color white;
  late Color container1;
  late Color container2;
  late Color green1;
  late Color container3;
  late Color border1;
  late Color border2;
  late Color containerBackground;

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
  String get welcomeTitleFamily => typography.welcomeTitleFamily;
  TextStyle get welcomeTitle1 => typography.welcomeTitle1;
  String get welcomeTitleFamily2 => typography.welcomeTitleFamily2;
  TextStyle get welcomeTitle2 => typography.welcomeTitle2;


  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary =  const Color(0xFF2F8FA9) ;
  late Color secondary = const Color(0xFF406B72);
  late Color tertiary = const Color(0xFF809B9E);
  late Color alternate = const Color(0xFFBFCDD0);
  late Color primaryText = const Color(0xFF0E181B);
  late Color secondaryText = const Color(0xFFFAFEFF);
  late Color primaryBackground = const Color(0xFFFAFEFF);
  late Color secondaryBackground = const Color(0xFF003943);
  late Color containerBackground =  const Color(0xFF153C47);
  late Color accent1 = const Color(0xFFD7EFE9);
  late Color accent2 = const Color(0xFFE5EBEC);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);
  late Color accent5 = const Color(0xFFF2F2F2);
  late Color black1 = const Color(0xFF0A252B);
  late Color tertiary1 = const Color(0xFF7F9B9E);
  late Color tertiary2 = const Color(0xFF487C8A);
  late Color white = const Color(0xFFFFFFFF);
  late Color container1 = const Color(0xFFE5F7F6);
  late Color container2 = const Color(0xFFDAE3FB);
  late Color green1 = const Color(0xFF00AAA3);
   late Color container3 = const Color(0xFFB4AAFF);
   late Color border1 = const Color(0xFFE0ECEC);
   late Color border2 = const Color(0xFFE9E9E9);

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
  String get welcomeTitleFamily;
  TextStyle get welcomeTitle1;
  String get welcomeTitleFamily2;
  TextStyle get welcomeTitle2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Bricolage Grotesque';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 57.0,
      );
  String get displayMediumFamily => 'Bricolage Grotesque';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 45.0,
      );
  String get displaySmallFamily => 'Bricolage Grotesque';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryBackground,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
        fontStyle: FontStyle.normal,
      );
  String get headlineLargeFamily => 'Bricolage Grotesque';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Bricolage Grotesque';
  TextStyle get headlineMedium => const TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: Color(0xFF303030),
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get headlineSmallFamily => 'Bricolage Grotesque';
  TextStyle get headlineSmall => const TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: Color(0xFF303030),
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Bricolage Grotesque';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Bricolage Grotesque';
  TextStyle get titleMedium => const TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: Color(0xFF757575),
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Bricolage Grotesque';
  TextStyle get titleSmall => const TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: Color(0xFF616161),
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Bricolage Grotesque';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      );
  String get labelMediumFamily => 'Bricolage Grotesque';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 12.0,
      );
  String get labelSmallFamily => 'Bricolage Grotesque';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11.0,
      );
  String get bodyLargeFamily => 'Bricolage Grotesque';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Bricolage Grotesque';
  TextStyle get bodyMedium => const TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: Color(0xFF303030),
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Bricolage Grotesque';
  TextStyle get bodySmall => const TextStyle(
        fontFamily: 'Bricolage Grotesque',
        color: Color(0xFF424242),
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get welcomeTitleFamily => 'Bricolage Grotesque';
  TextStyle get welcomeTitle1 => const TextStyle(
    fontFamily: 'Bricolage Grotesque',
    color: Color(0xFFFAFEFF),
    fontWeight: FontWeight.w400,
    fontSize: 40.0
  );
  String get welcomeTitleFamily2 => 'Bricolage Grotesque';
  TextStyle get welcomeTitle2 => const TextStyle(
      fontFamily: 'Bricolage Grotesque',
      color: Color(0xFFFAFEFF),
      fontWeight: FontWeight.w700,
      fontSize: 40.0
  );

}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
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
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
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
            );
}
