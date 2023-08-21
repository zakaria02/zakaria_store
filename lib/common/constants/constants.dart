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

  // Text styles
  static TextStyle titleStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
  );

  // Products list page
  static const productListPageTitle = "Zakaria's store";
}
