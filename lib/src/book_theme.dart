import 'package:flutter/material.dart';

/// Theme configuration for the BookCard widget.
class BookViewTheme {
  /// Creates a [BookViewTheme] with customizable properties.
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

  /// The gradient used for the book spine effect.
  final Gradient spineGradient;

  /// The width of the vertical line on the spine.
  final double spineLineWidth;

  /// The color of the vertical line on the spine.
  final Color spineLineColor;

  /// The border radius of the book cover.
  final double borderRadius;

  /// The shadow color of the book card.
  final Color shadowColor;

  /// The color of the "Purchased" badge.
  final Color purchasedBadgeColor;

  /// The color of the price badge.
  final Color priceBadgeColor;

  /// Whether to show the decorative frame line on the cover.
  final bool showFrameLine;

  /// The color of the decorative frame line.
  final Color frameLineColor;

  /// The text style for the book title.
  final TextStyle? titleStyle;

  /// The text style for the book author.
  final TextStyle? authorStyle;

  /// The text style for the badge label.
  final TextStyle? badgeTextStyle;

  /// Default theme configuration.
  static const BookViewTheme standard = BookViewTheme();
}
