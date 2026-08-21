# 📚 BookView Flutter

A premium, realistic book card widget for Flutter that brings the physical feel of a library to your digital applications. Features a 3D-like spine effect, customizable shadows, and deep theming support.

---

## 📸 Preview

<div align="center">
  <img src="https://raw.githubusercontent.com/Innocentkonan93/book_view_flutter/main/assets/preview.png" width="280" alt="BookView Grid Preview" />
  &nbsp;&nbsp;
  <img src="https://raw.githubusercontent.com/Innocentkonan93/book_view_flutter/main/assets/preview_horizontal.png" width="280" alt="BookView Horizontal Preview" />
  <p><i>Realistic book design with 3D spine — Grid view & Horizontal Carousel layouts</i></p>
</div>

---

## ✨ Features

- **Realistic 3D Binding**: Includes a subtle spine gradient and vertical details for a professional look.
- **Enhanced Depth**: Built-in multi-layered shadows for an authentic "card-on-table" feel.
- **Premium Themes**: Customize everything from spine colors and border radius to text styles and badge designs.
- **Offline & Performance Ready**: Powered by `cached_network_image` with optimized memory caching (`memCacheWidth`) for smooth performance on large lists.
- **Marketing & Engagement**: Highlight books with diagonal marketing ribbons (e.g. "Bestseller") and native reading progress bars.
- **Smart Badging & i18n**: Easily show prices or custom "Purchased" labels with elegant overlays.

---

## 🚀 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  book_view_flutter: ^0.2.1
```

---

## 📖 Usage

### Simple Usage

```dart
import 'package:book_view_flutter/book_view_flutter.dart';

BookView(
  imageUrl: 'https://example.com/cover.jpg',
  title: 'Clean Architecture',
  author: 'Robert C. Martin',
  priceLabel: '2500 F',
  ribbonText: 'BESTSELLER',
  readingProgress: 0.45, // Shows a 45% progress bar
  purchasedLabel: 'Acquired', // Localize the purchased badge
  onTap: () => print('Opening book...'),
)
```

### Displaying Asset Images

```dart
BookView.asset(
  assetPath: 'assets/images/clean_code.png',
  title: 'Clean Code',
  author: 'Robert C. Martin',
  priceLabel: '30,00 €',
)
```

### Horizontal List / Carousel View

```dart
SizedBox(
  height: 240,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: books.length,
    separatorBuilder: (context, index) => const SizedBox(width: 12),
    itemBuilder: (context, index) {
      final book = books[index];
      return SizedBox(
        width: 120,
        child: BookView(
          imageUrl: book.imageUrl,
          title: book.title,
          author: book.author,
          priceLabel: book.price,
          width: 120,
          height: 170,
        ),
      );
    },
  ),
)
```

### Advanced Theming

```dart
BookView(
  imageUrl: '...',
  title: '...',
  author: '...',
  theme: BookViewTheme(
    borderRadius: 8.0,
    purchasedBadgeColor: Colors.teal,
    titleStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
    showFrameLine: true,
    frameLineColor: Colors.white54,
    spineGradient: LinearGradient(
       colors: [Colors.white24, Colors.black38],
    ),
  ),
)
```

---

## 🛠 Customization Options

### BookView Widget Parameters

| Parameter         | Type            | Description                                                 |
| ----------------- | --------------- | ----------------------------------------------------------- |
| `imageUrl`        | `String`        | Image URL or Asset Path (depending on constructor).         |
| `isAsset`         | `bool`          | Internal flag (set automatically by `.asset()`).            |
| `title`           | `String`        | Book title displayed below the cover.                       |
| `author`          | `String`        | Author name displayed below the title.                      |
| `priceLabel`      | `String?`       | Text for the price overlay.                                 |
| `purchasedLabel`  | `String`        | Custom label for purchased state (default: 'Livre acheté'). |
| `isPurchased`     | `bool`          | Displays the purchased badge if true.                       |
| `readingProgress` | `double?`       | Reading progress bar value (0.0 to 1.0).                    |
| `ribbonText`      | `String?`       | Text for the marketing corner ribbon.                       |
| `theme`           | `BookViewTheme` | Style customization object.                                 |
| `width`           | `double`        | Width of the book cover (default: 120).                     |
| `height`          | `double`        | Height of the book cover (default: 180).                    |

### BookViewTheme Parameters

| Parameter                 | Type       | Default              | Description                               |
| ------------------------- | ---------- | -------------------- | ----------------------------------------- |
| `spineGradient`           | `Gradient` | Linear (white/black) | Gradient effect on the left side.         |
| `spineLineWidth`          | `double`   | 0.5                  | Width of the decorative vertical line.    |
| `spineLineColor`          | `Color`    | white (30%)          | Color of the decorative vertical line.    |
| `showFrameLine`           | `bool`     | true                 | Toggles the decorative inner border.      |
| `frameLineColor`          | `Color`    | white (50%)          | Color of the decorative inner border.     |
| `borderRadius`            | `double`   | 2.0                  | Radius for the book corners.              |
| `shadowColor`             | `Color`    | black (25%)          | Color of the card shadow.                 |
| `purchasedBadgeColor`     | `Color`    | Gold                 | Background color for purchased badge.     |
| `priceBadgeColor`         | `Color`    | Black (60%)          | Background color for price badge.         |
| `progressColor`           | `Color`    | White                | Foreground color of reading progress.     |
| `progressBackgroundColor` | `Color`    | Black (25%)          | Background color of reading progress.     |
| `ribbonColor`             | `Color`    | Red Accent           | Background color of the marketing ribbon. |

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## 📄 License

MIT License - Copyright (c) 2026 Innocent Konan
