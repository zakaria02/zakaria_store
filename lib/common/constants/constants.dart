import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Contains all type of constants used in the app.

class Constants {
  // Global design
  static const backgroundPrimary = Colors.white;
  static const double iconSize = 30.0;
  static const Color iconColor = Colors.black;

  //Global configuration
  static const timeoutDuration = Duration(seconds: 20);
  static const toastDuration = Duration(seconds: 10);
  static const String baseUrl = "https://fakestoreapi.com";
  static const String networkErrorTitle = "Network error";

  // Text styles
  static TextStyle titleStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
  );

  static TextStyle categoryTitleStyle = GoogleFonts.quicksand(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h1 = GoogleFonts.firaSans(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body = GoogleFonts.firaSans(
    color: Colors.black,
    fontSize: 17,
  );

  static TextStyle h3 = GoogleFonts.firaSans(
    color: Colors.grey[600]!,
    fontSize: 16,
  );

  // Products list page
  static const productListPageTitle = "Zakaria's store";
  static Color selectedCategoryColor = Colors.grey[200]!;
  static const Color defaultCategoryColor = Colors.white;
}
