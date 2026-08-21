import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'book_theme.dart';

/// A realistic book card widget with a spine effect and shadows.
class BookView extends StatelessWidget {
  /// Creates a [BookView] widget for network images.
  const BookView({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    this.priceLabel,
    this.purchasedLabel = 'Livre acheté',
    this.isPurchased = false,
    this.readingProgress,
    this.ribbonText,
    this.onTap,
    this.heroTag,
    this.width = 120,
    this.height = 180,
    this.theme,
  }) : isAsset = false;

  /// Creates a [BookView] widget for asset images.
  const BookView.asset({
    super.key,
    required String assetPath,
    required this.title,
    required this.author,
    this.priceLabel,
    this.purchasedLabel = 'Livre acheté',
    this.isPurchased = false,
    this.readingProgress,
    this.ribbonText,
    this.onTap,
    this.heroTag,
    this.width = 120,
    this.height = 180,
    this.theme,
  }) : imageUrl = assetPath,
       isAsset = true;

  /// The URL or asset path of the book cover image.
  final String imageUrl;

  /// Whether the image is an asset or a network image.
  final bool isAsset;

  /// The title of the book.
  final String title;

  /// The author of the book.
  final String author;

  /// An optional price label shown on the badge.
  final String? priceLabel;

  /// The label to show when the book is purchased.
  final String purchasedLabel;

  /// Whether the book is already purchased.
  final bool isPurchased;

  /// The reading progress of the book, from 0.0 to 1.0.
  final double? readingProgress;

  /// An optional text to display on a marketing ribbon (e.g. "Bestseller").
  final String? ribbonText;

  /// Callback when the book card is tapped.
  final VoidCallback? onTap;

  /// Unique tag for [Hero] animation. Defaults to [imageUrl] if null.
  final String? heroTag;

  /// The width of the book card.
  final double width;

  /// The height of the book card image.
  final double height;

  /// Theme configuration for the book card.
  /// If null, uses the [BookViewTheme] from the [BuildContext].
  final BookViewTheme? theme;

  @override
  Widget build(BuildContext context) {
    final effectiveTheme = theme ?? BookViewTheme.of(context);
    final flutterTheme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: heroTag ?? imageUrl,
        child: SizedBox(
          width: width,
          height: height + 60, // Extra space for title and author
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Main Cover Image
                    _BookCoverImage(
                      imageUrl: imageUrl,
                      isAsset: isAsset,
                      theme: effectiveTheme,
                    ),

                    // Realistic Spine Effect
                    _BookSpine(theme: effectiveTheme),

                    // Price or Purchased Badge
                    if (priceLabel != null || isPurchased)
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: _BookBadge(
                          label: isPurchased ? purchasedLabel : priceLabel!,
                          isPurchased: isPurchased,
                          theme: effectiveTheme,
                        ),
                      ),

                    // Reading Progress
                    if (readingProgress != null && readingProgress! > 0)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              effectiveTheme.borderRadius,
                            ),
                            bottomRight: Radius.circular(
                              effectiveTheme.borderRadius,
                            ),
                          ),
                          child: LinearProgressIndicator(
                            value: readingProgress,
                            backgroundColor:
                                effectiveTheme.progressBackgroundColor,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              effectiveTheme.progressColor,
                            ),
                            minHeight: 4,
                          ),
                        ),
                      ),

                    // Marketing Ribbon
                    if (ribbonText != null && ribbonText!.isNotEmpty)
                      Positioned(
                        top: 12,
                        left: -28,
                        child: Transform.rotate(
                          angle: -0.785398, // -45 degrees in radians
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            color: effectiveTheme.ribbonColor,
                            alignment: Alignment.center,
                            child: Text(
                              ribbonText!.toUpperCase(),
                              style:
                                  effectiveTheme.ribbonTextStyle ??
                                  flutterTheme.textTheme.labelSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                    letterSpacing: 1.2,
                                  ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    effectiveTheme.titleStyle ??
                    flutterTheme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    effectiveTheme.authorStyle ??
                    flutterTheme.textTheme.bodySmall?.copyWith(
                      color: flutterTheme.primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookCoverImage extends StatelessWidget {
  const _BookCoverImage({
    required this.imageUrl,
    required this.isAsset,
    required this.theme,
  });

  final String imageUrl;
  final bool isAsset;
  final BookViewTheme theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(theme.borderRadius),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(theme.borderRadius),
        child: isAsset
            ? Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
                errorBuilder: (context, error, stackTrace) =>
                    _ErrorPlaceholder(),
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  final devicePixelRatio = MediaQuery.devicePixelRatioOf(
                    context,
                  );

                  final memCacheWidth =
                      (constraints.maxWidth * devicePixelRatio).round();
                  return CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                    memCacheWidth: memCacheWidth,
                    placeholder: (context, url) =>
                        _ShimmerPlaceholder(borderRadius: theme.borderRadius),
                    errorWidget: (context, url, error) => _ErrorPlaceholder(),
                  );
                },
              ),
      ),
    );
  }
}

class _BookSpine extends StatelessWidget {
  const _BookSpine({required this.theme});

  final BookViewTheme theme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Realistic Spine Effect
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          width: 10,
          child: Container(
            decoration: BoxDecoration(gradient: theme.spineGradient),
          ),
        ),

        // Realistic Inside Border
        Positioned(
          top: 0,
          bottom: 0,
          left: 6,
          child: Container(
            width: theme.spineLineWidth,
            color: theme.spineLineColor,
          ),
        ),
        if (theme.showFrameLine)
          Positioned(
            top: 0,
            bottom: 0,
            left: 8,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: theme.frameLineColor),
              ),
            ),
          ),
      ],
    );
  }
}

class _BookBadge extends StatelessWidget {
  const _BookBadge({
    required this.label,
    required this.isPurchased,
    required this.theme,
  });

  final String label;
  final bool isPurchased;
  final BookViewTheme theme;

  @override
  Widget build(BuildContext context) {
    final flutterTheme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isPurchased ? theme.purchasedBadgeColor : theme.priceBadgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style:
            theme.badgeTextStyle ??
            flutterTheme.textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class _ShimmerPlaceholder extends StatelessWidget {
  const _ShimmerPlaceholder({required this.borderRadius});

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class _ErrorPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
      ),
    );
  }
}
