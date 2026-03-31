import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    this.isPurchased = false,
    this.onTap,
    this.heroTag,
    this.width = 120,
    this.height = 180,
    this.theme = BookViewTheme.standard,
  }) : isAsset = false;

  /// Creates a [BookView] widget for asset images.
  const BookView.asset({
    super.key,
    required String assetPath,
    required this.title,
    required this.author,
    this.priceLabel,
    this.isPurchased = false,
    this.onTap,
    this.heroTag,
    this.width = 120,
    this.height = 180,
    this.theme = BookViewTheme.standard,
  })  : imageUrl = assetPath,
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

  /// Whether the book is already purchased.
  final bool isPurchased;

  /// Callback when the book card is tapped.
  final VoidCallback? onTap;

  /// Unique tag for [Hero] animation. Defaults to [imageUrl] if null.
  final String? heroTag;

  /// The width of the book card.
  final double width;

  /// The height of the book card image.
  final double height;

  /// Theme configuration for the book card.
  final BookViewTheme theme;

  @override
  Widget build(BuildContext context) {
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
                    Container(
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
                                errorBuilder: (context, error, stackTrace) => Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.book),
                                ),
                              )
                            : CachedNetworkImage(
                                imageUrl: imageUrl,
                                fit: BoxFit.cover,
                                alignment: Alignment.topLeft,
                                placeholder: (context, url) => Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.book),
                                ),
                              ),
                      ),
                    ),

                    // Realistic Spine Effect
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      width: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: theme.spineGradient,
                        ),
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: theme.frameLineColor),
                          ),
                        ),
                      ),
                    // Price or Purchased Badge
                    if (priceLabel != null || isPurchased)
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isPurchased
                                ? theme.purchasedBadgeColor
                                : theme.priceBadgeColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            isPurchased ? "Livre acheté" : priceLabel!,
                            style:
                                theme.badgeTextStyle ??
                                flutterTheme.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
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
                    theme.titleStyle ??
                    flutterTheme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    theme.authorStyle ??
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
