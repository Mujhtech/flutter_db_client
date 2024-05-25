import 'package:flutter/material.dart';
import 'package:flutter_db_client/presentation/presentation.dart';

const Color _kPrimaryLightColor = Color(0xFF006B5A);
const Color _kPrimaryDarkColor = Color(0xFF5BDBBF);
const Color _kBackgroundDarkColor = Color(0xFF1C1C1E);
const Color _kBackgroundLightColor = Color(0xFFF2F2F7);
const double _kIconSize = 28.0;

@visibleForTesting
class AppColor {
  const AppColor._();

  final Color success = const Color(0xFF239f77);
  final Color onSuccess = const Color(0xFFFFFFFF);

  final Color danger = const Color(0xFFEB5757);
  final Color onDanger = const Color(0xFFFFFFFF);
}

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme._();

  final AppColor color = const AppColor._();

  final BorderRadius textFieldBorderRadius = AppBorderRadius.md;

  @override
  ThemeExtension<AppTheme> copyWith() => this;

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) =>
      this;
}

ThemeData themeBuilder(
  ThemeData defaultTheme, {
  AppTheme appTheme = const AppTheme._(),
}) {
  final Brightness brightness = defaultTheme.brightness;
  final bool isDark = brightness == Brightness.dark;

  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: isDark ? _kPrimaryDarkColor : _kPrimaryLightColor,
    brightness: brightness,
  );
  final Color scaffoldBackgroundColor =
      isDark ? _kBackgroundDarkColor : _kBackgroundLightColor;

  final Color cardColor = isDark ? Colors.black : Colors.white;

  final Color iconColor = isDark ? Colors.white : Colors.black;

  final OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: appTheme.textFieldBorderRadius,
  );
  final OutlineInputBorder textFieldErrorBorder = textFieldBorder.copyWith(
    borderSide: BorderSide(color: colorScheme.error),
  );

  final TextTheme textTheme =
      defaultTheme.textTheme.apply(fontFamily: kDefaultAppFontFamily);

  final TextStyle? buttonTextStyle = textTheme.labelMedium?.copyWith(
    fontWeight: AppFontWeight.semibold,
  );
  final ButtonStyle buttonStyle = ButtonStyle(
    textStyle: WidgetStateProperty.all(buttonTextStyle),
    elevation: WidgetStateProperty.all(0),
  );

  return ThemeData(
    useMaterial3: true,
    iconTheme:
        defaultTheme.iconTheme.copyWith(size: _kIconSize, color: iconColor),
    primaryIconTheme: defaultTheme.primaryIconTheme.copyWith(size: _kIconSize),
    textTheme: defaultTheme.textTheme.merge(textTheme),
    cardColor: cardColor,
    primaryTextTheme: defaultTheme.primaryTextTheme.merge(textTheme),
    shadowColor: colorScheme.scrim,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textButtonTheme: TextButtonThemeData(style: buttonStyle),
    filledButtonTheme: FilledButtonThemeData(style: buttonStyle),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: colorScheme.secondaryContainer,
      foregroundColor: colorScheme.onSecondaryContainer,
    ),
    colorScheme: colorScheme,
    inputDecorationTheme: InputDecorationTheme(
      border: textFieldBorder,
      focusedBorder: textFieldBorder,
      enabledBorder: textFieldBorder,
      errorBorder: textFieldErrorBorder,
      focusedErrorBorder: textFieldErrorBorder,
      contentPadding: const EdgeInsets.all(10),
      filled: true,
    ),
    fontFamily: kDefaultAppFontFamily,
    extensions: <ThemeExtension<dynamic>>{
      appTheme,
    },
  );
}

extension AppThemeThemeDataExtensions on ThemeData {
  AppTheme get appTheme => extension<AppTheme>()!;
}

extension BuildContextThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color? get backgroundColor => Theme.of(this).colorScheme.surface;

  Color? get cardColor => Theme.of(this).cardColor;

  Color? get iconColor => Theme.of(this).iconTheme.color;
}
