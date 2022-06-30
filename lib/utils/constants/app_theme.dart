import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_route_transition.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: AppRouteTransition(),
        TargetPlatform.iOS: AppRouteTransition(),
      },
    ),
    primaryColor: const Color(0xFF05B046),
    errorColor: Colors.redAccent,
    canvasColor: Colors.grey,
    // scaffoldBackgroundColor: const Color(0xFFF2F2F4),
    dividerTheme: DividerThemeData(
      color: Colors.grey.withOpacity(0.3),
      thickness: 1,
      indent: 16.w,
      endIndent: 16.w,
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: const Color(0xFF49464D),
      errorColor: Colors.redAccent,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFF05B046),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF05B046)),
    textTheme: TextTheme(
      headline1: GoogleFonts.poppins(
        fontSize: 93.sp,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: const Color(0xFF49464D),
      ),
      headline2: GoogleFonts.poppins(
        fontSize: 58.sp,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: const Color(0xFF49464D),
      ),
      headline3: GoogleFonts.poppins(
        fontSize: 46.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF49464D),
      ),
      headline4: GoogleFonts.poppins(
        fontSize: 33.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: const Color(0xFF49464D),
      ),
      headline5: GoogleFonts.poppins(
        fontSize: 23.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF49464D),
      ),
      headline6: GoogleFonts.poppins(
        fontSize: 19.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: const Color(0xFF49464D),
      ),
      subtitle1: GoogleFonts.poppins(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: const Color(0xFF49464D),
      ),
      subtitle2: GoogleFonts.poppins(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: const Color(0xFF49464D),
      ),
      bodyText1: GoogleFonts.openSans(
        color: const Color(0xFF16161D),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyText2: GoogleFonts.openSans(
        color: const Color(0xFF16161D),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      button: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      caption: GoogleFonts.openSans(
        color: Colors.grey,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: GoogleFonts.openSans(
        color: Colors.grey,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xFF05B046).withOpacity(0.4),
      selectionHandleColor: const Color(0xFF05B046),
      cursorColor: const Color(0xFF05B046),
    ),
    cardColor: const Color(0xFFEAEAEA),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Colors.grey),
      floatingLabelStyle: const TextStyle(color: Colors.black38),
      isCollapsed: true,
      isDense: false,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.05),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.05),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(const Color(0xFF05B046)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.r),
      ),
    ),
    radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all<Color>(const Color(0xFF05B046))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF05B046)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        maximumSize: MaterialStateProperty.all<Size>(Size(400.w, 46.h)),
        minimumSize: MaterialStateProperty.all<Size>(Size(400.w, 46.h)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    ),
  );
}
