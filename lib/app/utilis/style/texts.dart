import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final fontFamily = GoogleFonts.kranky().fontFamily;

/// Moderate size and weight... Use majorly in Profile screen
TextStyle bodyLarge = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w300,
  fontSize: 16,
);

/// Greater weight and size... Use mainly in the ride setup
TextStyle bodyMedium = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w300,
  fontSize: 14,
  color: Colors.black,
);

TextStyle bodySmall = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: const Color(0xFF414244),
);

TextStyle button = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: const Color(0xFF414244),
);
