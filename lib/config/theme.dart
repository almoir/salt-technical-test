import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mainColors = const Color(0xffd41668);
Color secondColors = const Color(0xFFf9ffff);

Color lightBGColor = const Color(0xffF6F8FB);
Color darkBGColor = const Color(0xff020518);

Color whiteColor = const Color(0xffFFFFFF);
Color blackColor = const Color(0xff14193F);
Color greyColor = const Color(0xffA4A8AE);
Color blueColor = const Color(0xff53C1F9);
Color purpleColor = const Color(0xff5142E6);
Color greenColor = const Color(0xff22B07D);
Color redColor = const Color(0xff8B0000);

TextStyle blackTextStyle = GoogleFonts.lato(
  color: blackColor,
);
TextStyle whiteTextStyle = GoogleFonts.lato(
  color: whiteColor,
);
TextStyle greyTextStyle = GoogleFonts.lato(
  color: greyColor,
);
TextStyle blueTextStyle = GoogleFonts.lato(
  color: blueColor,
);
TextStyle greenTextStyle = GoogleFonts.lato(
  color: greenColor,
);
TextStyle redTextStyle = GoogleFonts.lato(
  color: redColor,
);
TextStyle orangeTextStyle = GoogleFonts.lato(
  color: Colors.orangeAccent,
);

FontWeight light = FontWeight.w300;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

ThemeData getApplicationThemeData() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: lightBGColor,
    colorScheme: ColorScheme.light(primary: mainColors),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(mainColors),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: mainColors,
      elevation: 4,
      centerTitle: true,
    ),
  );
}
