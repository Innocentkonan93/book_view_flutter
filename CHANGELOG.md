## [0.2.1] - 2026-08-21

### Fixed

- Adapted network image memory cache width to the rendered book width and device pixel ratio.
- Improved image resolution for larger book cards.
- Reduced unnecessary image decoding size for smaller book cards.

# 0.2.0

- **Feature:** Migrated `BookViewTheme` to extend Flutter's `ThemeExtension<BookViewTheme>`, enabling seamless global theme integration via `ThemeData(extensions: [...])` and context lookup with `BookViewTheme.of(context)`.
- **Feature:** Added `copyWith` and `lerp` support for smooth theme transitions and animations in `BookViewTheme`.
- **Feature:** Added `readingProgress` parameter to display a native elegant progress bar with customizable `progressBackgroundColor` and `progressColor`.
- **Feature:** Added customizable marketing `ribbonText` with customizable `ribbonColor` and `ribbonTextStyle` to highlight specific editions (e.g. "Bestseller").
- **Feature:** Added translation support (i18n) for the purchased badge via the custom `purchasedLabel` parameter.
- **Performance:** Implemented initial memory caching for network images using `memCacheWidth`.

# 0.1.0

- **Feature:** Added `BookView.asset` constructor for local asset support.
- **Doc:** Reached 100% dartdoc coverage for public API.
- **Maintenance:** Optimized for 160/160 pub.dev score.

# 0.0.1+1

- Initial release of `book_view_flutter`.
- Premium realistic book card widget with 3D-like spine effect.
- Customizable `BookViewTheme` for deep style control.
- Integration with `cached_network_image` for optimized cover loading.
- Support for price badges and "purchased" status overlays.
- Comprehensive example project included.
