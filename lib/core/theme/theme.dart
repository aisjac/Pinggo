import "package:flutter/material.dart";
import "package:flutter/services.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFEE5F22),
      surfaceTint: Color(0xffa93800),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffcd4805),
      onPrimaryContainer: Color(0xfffffbff),
      secondary: Color(0xff74341a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff914b2f),
      onSecondaryContainer: Color(0xffffcebc),
      tertiary: Color(0xff74341a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff914b2f),
      onTertiaryContainer: Color(0xffffcebc),
      error: Color(0xff74341a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff914b2f),
      onErrorContainer: Color(0xffffcebc),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff261814),
      onSurfaceVariant: Color(0xff594139),
      outline: Color(0xff8d7167),
      outlineVariant: Color(0xffe2bfb4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3c2d28),
      inversePrimary: Color(0xffffb59b),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff380d00),
      primaryFixedDim: Color(0xffffb59b),
      onPrimaryFixedVariant: Color(0xff812900),
      secondaryFixed: Color(0xffffdbce),
      onSecondaryFixed: Color(0xff370d00),
      secondaryFixedDim: Color(0xffffb59a),
      onSecondaryFixedVariant: Color(0xff74341a),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff370d00),
      tertiaryFixedDim: Color(0xffffb59a),
      onTertiaryFixedVariant: Color(0xff74341a),
      surfaceDim: Color(0xffeed5cc),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xffffe9e3),
      surfaceContainerHigh: Color(0xfffde3da),
      surfaceContainerHighest: Color(0xfff7ddd5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFEE5F22),
      surfaceTint: Color(0xffa93800),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc24200),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5e240b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff914b2f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5e240b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff914b2f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff5e240b),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff914b2f),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff1a0e0a),
      onSurfaceVariant: Color(0xff473129),
      outline: Color(0xff664d44),
      outlineVariant: Color(0xff83675d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3c2d28),
      inversePrimary: Color(0xffffb59b),
      primaryFixed: Color(0xffc24200),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff993200),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffa3593c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff854227),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa3593c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff854227),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdac1b9),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffde3da),
      surfaceContainerHigh: Color(0xfff1d7cf),
      surfaceContainerHighest: Color(0xffe5ccc4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFEE5F22),
      surfaceTint: Color(0xffa93800),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff852a00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff511b03),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff77371c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff511b03),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff77371c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff511b03),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff77371c),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff3c271f),
      outlineVariant: Color(0xff5c443b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3c2d28),
      inversePrimary: Color(0xffffb59b),
      primaryFixed: Color(0xff852a00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5f1c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff77371c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5a2108),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff77371c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5a2108),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffccb4ac),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffede7),
      surfaceContainer: Color(0xfff7ddd5),
      surfaceContainerHigh: Color(0xffe8cfc7),
      surfaceContainerHighest: Color(0xffdac1b9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb59b),
      surfaceTint: Color(0xffffb59b),
      onPrimary: Color(0xff5b1a00),
      primaryContainer: Color(0xfff36326),
      onPrimaryContainer: Color(0xff491400),
      secondary: Color(0xffffb59a),
      onSecondary: Color(0xff571f06),
      secondaryContainer: Color(0xff914b2f),
      onSecondaryContainer: Color(0xffffcebc),
      tertiary: Color(0xffffb59a),
      onTertiary: Color(0xff571f06),
      tertiaryContainer: Color(0xff914b2f),
      onTertiaryContainer: Color(0xffffcebc),
      error: Color(0xffffb59a),
      onError: Color(0xff571f06),
      errorContainer: Color(0xff914b2f),
      onErrorContainer: Color(0xffffcebc),
      surface: Color(0xff1d100c),
      onSurface: Color(0xfff7ddd5),
      onSurfaceVariant: Color(0xffe2bfb4),
      outline: Color(0xffa98a80),
      outlineVariant: Color(0xff594139),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff7ddd5),
      inversePrimary: Color(0xffa93800),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff380d00),
      primaryFixedDim: Color(0xffffb59b),
      onPrimaryFixedVariant: Color(0xff812900),
      secondaryFixed: Color(0xffffdbce),
      onSecondaryFixed: Color(0xff370d00),
      secondaryFixedDim: Color(0xffffb59a),
      onSecondaryFixedVariant: Color(0xff74341a),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff370d00),
      tertiaryFixedDim: Color(0xffffb59a),
      onTertiaryFixedVariant: Color(0xff74341a),
      surfaceDim: Color(0xff1d100c),
      surfaceBright: Color(0xff463630),
      surfaceContainerLowest: Color(0xff170b07),
      surfaceContainerLow: Color(0xff261814),
      surfaceContainer: Color(0xff2a1c17),
      surfaceContainerHigh: Color(0xff352721),
      surfaceContainerHighest: Color(0xff41312c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd3c4),
      surfaceTint: Color(0xffffb59b),
      onPrimary: Color(0xff491400),
      primaryContainer: Color(0xfff36326),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd3c3),
      onSecondary: Color(0xff481400),
      secondaryContainer: Color(0xffce7c5c),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd3c3),
      onTertiary: Color(0xff481400),
      tertiaryContainer: Color(0xffce7c5c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd3c3),
      onError: Color(0xff481400),
      errorContainer: Color(0xffce7c5c),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1d100c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff8d5c9),
      outline: Color(0xffccaba0),
      outlineVariant: Color(0xffa88a7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff7ddd5),
      inversePrimary: Color(0xff832a00),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff260700),
      primaryFixedDim: Color(0xffffb59b),
      onPrimaryFixedVariant: Color(0xff651e00),
      secondaryFixed: Color(0xffffdbce),
      onSecondaryFixed: Color(0xff260700),
      secondaryFixedDim: Color(0xffffb59a),
      onSecondaryFixedVariant: Color(0xff5e240b),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff260700),
      tertiaryFixedDim: Color(0xffffb59a),
      onTertiaryFixedVariant: Color(0xff5e240b),
      surfaceDim: Color(0xff1d100c),
      surfaceBright: Color(0xff52413b),
      surfaceContainerLowest: Color(0xff0f0503),
      surfaceContainerLow: Color(0xff281a16),
      surfaceContainer: Color(0xff33241f),
      surfaceContainerHigh: Color(0xff3f2f2a),
      surfaceContainerHighest: Color(0xff4b3a34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece6),
      surfaceTint: Color(0xffffb59b),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb093),
      onPrimaryContainer: Color(0xff1c0400),
      secondary: Color(0xffffece6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb092),
      onSecondaryContainer: Color(0xff1c0400),
      tertiary: Color(0xffffece6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffb092),
      onTertiaryContainer: Color(0xff1c0400),
      error: Color(0xffffece6),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffb092),
      onErrorContainer: Color(0xff1c0400),
      surface: Color(0xff1d100c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece6),
      outlineVariant: Color(0xffddbbb0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff7ddd5),
      inversePrimary: Color(0xff832a00),
      primaryFixed: Color(0xffffdbcf),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb59b),
      onPrimaryFixedVariant: Color(0xff260700),
      secondaryFixed: Color(0xffffdbce),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb59a),
      onSecondaryFixedVariant: Color(0xff260700),
      tertiaryFixed: Color(0xffffdbce),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb59a),
      onTertiaryFixedVariant: Color(0xff260700),
      surfaceDim: Color(0xff1d100c),
      surfaceBright: Color(0xff5e4c46),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff2a1c17),
      surfaceContainer: Color(0xff3c2d28),
      surfaceContainerHigh: Color(0xff483832),
      surfaceContainerHighest: Color(0xff54433d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),

        inputDecorationTheme: InputDecorationTheme(
          fillColor: colorScheme.secondary.withOpacity(0.05),
          contentPadding: const EdgeInsets.all(14),
          outlineBorder: const BorderSide(width: 0),
          filled: true,
          hintStyle:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),

        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
