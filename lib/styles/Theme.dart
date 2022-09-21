import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/styles/Color.dart';

ThemeData lightTheme = ThemeData(
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: defaultColor),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
  primarySwatch: defaultColor ,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey[600],
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepOrange,
      type: BottomNavigationBarType.fixed),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
);

ThemeData darktTheme = ThemeData(
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: HexColor('333739')),
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: HexColor('333739'),
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: HexColor('333739')),
      elevation: 0.0,
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey[300],
      backgroundColor: HexColor('333739'),
      selectedItemColor: Colors.deepOrange,
      type: BottomNavigationBarType.fixed),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
);
