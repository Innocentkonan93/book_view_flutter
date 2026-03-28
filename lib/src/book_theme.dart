import 'package:flutter/material.dart';

/// Theme configuration for the BookCard widget.
class BookViewTheme {
  const BookViewTheme({
    this.spineGradient = const LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [
        Color(0x1A666666), // white with alpha .1 (approx)
        Color(0x33000000), // black with alpha .2
      ],
    ),
    this.spineLineWidth = 0.5,
    this.spineLineColor = const Color(0x4DFFFFFF), // white with alpha .3
    this.borderRadius = 2.0,
    this.shadowColor = const Color(0x40000000), // black with alpha .25
    this.purchasedBadgeColor = const Color(0xFFE29A1E),
    this.priceBadgeColor = const Color(0x99000000), // black with alpha .6
    this.showFrameLine = true,
    this.frameLineColor = const Color(0x80FFFFFF), // white with alpha .5
    this.titleStyle,
    this.authorStyle,
    this.badgeTextStyle,
  });

  final Gradient spineGradient;
  final double spineLineWidth;
  final Color spineLineColor;
  final double borderRadius;
  final Color shadowColor;
  final Color purchasedBadgeColor;
  final Color priceBadgeColor;
  final bool showFrameLine;
  final Color frameLineColor;
  final TextStyle? titleStyle;
  final TextStyle? authorStyle;
  final TextStyle? badgeTextStyle;

  /// Default theme configuration.
  static const BookViewTheme standard = BookViewTheme();
}
