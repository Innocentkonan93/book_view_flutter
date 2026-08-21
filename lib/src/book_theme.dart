import 'package:flutter/material.dart';

/// Theme configuration for the BookCard widget.
class BookViewTheme extends ThemeExtension<BookViewTheme> {
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
    this.progressBackgroundColor = const Color(
      0x40000000,
    ), // black with alpha .25
    this.progressColor = const Color(0xFFFFFFFF), // white
    this.ribbonColor = const Color(0xFFE53935), // red
    this.ribbonTextStyle,
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

  /// The background color of the reading progress bar.
  final Color progressBackgroundColor;

  /// The foreground color of the reading progress bar.
  final Color progressColor;

  /// The background color of the marketing ribbon.
  final Color ribbonColor;

  /// The text style for the marketing ribbon.
  final TextStyle? ribbonTextStyle;

  /// Default theme configuration.
  static const BookViewTheme standard = BookViewTheme();

  /// Access the [BookViewTheme] from the [BuildContext].
  static BookViewTheme of(BuildContext context) {
    return Theme.of(context).extension<BookViewTheme>() ?? standard;
  }

  @override
  BookViewTheme copyWith({
    Gradient? spineGradient,
    double? spineLineWidth,
    Color? spineLineColor,
    double? borderRadius,
    Color? shadowColor,
    Color? purchasedBadgeColor,
    Color? priceBadgeColor,
    bool? showFrameLine,
    Color? frameLineColor,
    TextStyle? titleStyle,
    TextStyle? authorStyle,
    TextStyle? badgeTextStyle,
    Color? progressBackgroundColor,
    Color? progressColor,
    Color? ribbonColor,
    TextStyle? ribbonTextStyle,
  }) {
    return BookViewTheme(
      spineGradient: spineGradient ?? this.spineGradient,
      spineLineWidth: spineLineWidth ?? this.spineLineWidth,
      spineLineColor: spineLineColor ?? this.spineLineColor,
      borderRadius: borderRadius ?? this.borderRadius,
      shadowColor: shadowColor ?? this.shadowColor,
      purchasedBadgeColor: purchasedBadgeColor ?? this.purchasedBadgeColor,
      priceBadgeColor: priceBadgeColor ?? this.priceBadgeColor,
      showFrameLine: showFrameLine ?? this.showFrameLine,
      frameLineColor: frameLineColor ?? this.frameLineColor,
      titleStyle: titleStyle ?? this.titleStyle,
      authorStyle: authorStyle ?? this.authorStyle,
      badgeTextStyle: badgeTextStyle ?? this.badgeTextStyle,
      progressBackgroundColor:
          progressBackgroundColor ?? this.progressBackgroundColor,
      progressColor: progressColor ?? this.progressColor,
      ribbonColor: ribbonColor ?? this.ribbonColor,
      ribbonTextStyle: ribbonTextStyle ?? this.ribbonTextStyle,
    );
  }

  @override
  BookViewTheme lerp(ThemeExtension<BookViewTheme>? other, double t) {
    if (other is! BookViewTheme) return this;
    return BookViewTheme(
      spineGradient: Gradient.lerp(spineGradient, other.spineGradient, t)!,
      spineLineWidth: t < 0.5 ? spineLineWidth : other.spineLineWidth,
      spineLineColor: Color.lerp(spineLineColor, other.spineLineColor, t)!,
      borderRadius: t < 0.5 ? borderRadius : other.borderRadius,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      purchasedBadgeColor: Color.lerp(
        purchasedBadgeColor,
        other.purchasedBadgeColor,
        t,
      )!,
      priceBadgeColor: Color.lerp(priceBadgeColor, other.priceBadgeColor, t)!,
      showFrameLine: t < 0.5 ? showFrameLine : other.showFrameLine,
      frameLineColor: Color.lerp(frameLineColor, other.frameLineColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t),
      authorStyle: TextStyle.lerp(authorStyle, other.authorStyle, t),
      badgeTextStyle: TextStyle.lerp(badgeTextStyle, other.badgeTextStyle, t),
      progressBackgroundColor: Color.lerp(
        progressBackgroundColor,
        other.progressBackgroundColor,
        t,
      )!,
      progressColor: Color.lerp(progressColor, other.progressColor, t)!,
      ribbonColor: Color.lerp(ribbonColor, other.ribbonColor, t)!,
      ribbonTextStyle: TextStyle.lerp(
        ribbonTextStyle,
        other.ribbonTextStyle,
        t,
      ),
    );
  }
}
