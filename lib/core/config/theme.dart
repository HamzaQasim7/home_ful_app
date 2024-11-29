import 'package:flutter/material.dart';

import '../constants/constants.dart';

extension ThemeExtension on BuildContext {
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;

  ElevatedButtonThemeData get elevatedButtonTheme =>
      Theme.of(this).elevatedButtonTheme;
  InputDecorationTheme get inputDecoration =>
      Theme.of(this).inputDecorationTheme;
}

ThemeData getApplicationTheme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Palette.primary),
      primaryColor: Palette.primary,
      useMaterial3: true,
      primaryColorLight: Palette.primaryLight,
      scaffoldBackgroundColor: Palette.homeBackground,
      primaryColorDark: Palette.primary,
      disabledColor: Palette.grey7f7f,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Palette.white,
        surfaceTintColor: null,
      ),
      splashColor: Palette.primaryLight,
      cardTheme: const CardTheme(
          color: Palette.white,
          shadowColor: Palette.grey7f7f,
          elevation: Sizes.s4),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        color: Palette.white,
        elevation: Sizes.s4,
        shadowColor: Palette.black333,
        titleTextStyle:
            getMediumStyle(color: Palette.black, fontSize: Sizes.s20)
                .copyWith(letterSpacing: 0.5),
      ),
      iconTheme: const IconThemeData(
          color: Palette.black, fill: 0, weight: 300, opticalSize: 48),
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: Palette.grey7f7f,
          buttonColor: Palette.primary,
          splashColor: Palette.primaryE7F),
      radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(Palette.primary),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.primary,
          disabledForegroundColor: Palette.white,
          disabledBackgroundColor: Palette.grey7272,
          textStyle: getMediumStyle(fontSize: Sizes.s16, color: Palette.white),
          padding: const EdgeInsets.symmetric(vertical: Sizes.s16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.s12),
          ),
        ),
      ),
      drawerTheme: DrawerThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.s0))),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: Palette.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.s16),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.s8,
              vertical: Sizes.s0,
            ),
            textStyle:
                getMediumStyle(fontSize: Sizes.s14, color: Palette.primary)),
      ),
      dropdownMenuTheme: const DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Palette.greyf5f7,
        ),
      ),
      textTheme: TextTheme(
          displayLarge:
              getBoldStyle(color: Palette.primary, fontSize: Sizes.s40),
          displayMedium:
              getBoldStyle(color: Palette.primary, fontSize: Sizes.s28),
          displaySmall:
              getBoldStyle(color: Palette.primary, fontSize: Sizes.s18)
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
          headlineLarge:
              getSemiBoldStyle(color: Palette.primary, fontSize: Sizes.s40),
          headlineMedium:
              getSemiBoldStyle(color: Palette.primary, fontSize: Sizes.s28),
          headlineSmall:
              getSemiBoldStyle(color: Palette.primary, fontSize: Sizes.s18),
          titleLarge:
              getMediumStyle(color: Palette.black2422, fontSize: Sizes.s16)
                  .copyWith(fontWeight: FontWeight.w600),
          titleMedium:
              getMediumStyle(color: Palette.black2422, fontSize: Sizes.s14),
          titleSmall:
              getMediumStyle(color: Palette.black2422, fontSize: Sizes.s12),
          bodyMedium:
              getRegularStyle(color: Palette.black4947, fontSize: Sizes.s14)
                  .copyWith(
            fontWeight: FontWeight.w500,
            color: Palette.black2422,
          ),
          bodySmall:
              getRegularStyle(color: Palette.grey5050, fontSize: Sizes.s11)
                  .copyWith(fontWeight: FontWeight.w300),
          bodyLarge:
              getRegularStyle(color: Palette.black4947, fontSize: Sizes.s16)),

      // input decoration theme (text form field)
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.s100)),
        backgroundColor: Palette.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Sizes.s16, vertical: Sizes.s12),
        hintStyle:
            getRegularStyle(color: Palette.hintText, fontSize: Sizes.s14),
        labelStyle: getMediumStyle(color: Palette.black),
        alignLabelWithHint: true,
        errorStyle: getRegularStyle(color: Palette.red, fontSize: Sizes.s12),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        fillColor: Palette.white,
        isDense: true,
        errorMaxLines: 3,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.greyE6EA),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s4)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.greyE6EA),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s4)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.greyE6EA),
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s4)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.red, width: Sizes.s0_5),
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.s4),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Palette.red10, width: Sizes.s0_5),
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.s8),
          ),
        ),
      ));
}
