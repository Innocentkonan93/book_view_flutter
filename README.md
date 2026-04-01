# 📚 BookView Flutter

A premium, realistic book card widget for Flutter that brings the physical feel of a library to your digital applications. Features a 3D-like spine effect, customizable shadows, and deep theming support.

---

## 📸 Preview

<div align="center">
  <img src="https://raw.githubusercontent.com/Innocentkonan93/book_view_flutter/main/assets/preview.png" width="300" alt="BookView Preview" />
  <p><i>Realistic book design with 3D spine and custom badges</i></p>
</div>

---

## ✨ Features

- **Realistic 3D Binding**: Includes a subtle spine gradient and vertical details for a professional look.
- **Enhanced Depth**: Built-in multi-layered shadows for an authentic "card-on-table" feel.
- **Premium Themes**: Customize everything from spine colors and border radius to text styles and badge designs.
- **Offline Ready**: Powered by `cached_network_image` for smooth performance and cached covers.
- **Smart Badging**: Easily show prices or "Purchased" status with elegant overlays.

---

## 🚀 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  book_view_flutter: ^0.1.0
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

| Parameter     | Type            | Description                                |
| ------------- | --------------- | ------------------------------------------ |
| `imageUrl`    | `String`        | Image URL or Asset Path (depending on constructor). |
| `isAsset`     | `bool`          | Internal flag (set automatically by `.asset()`).   |
| `title`       | `String`        | Book title displayed below the cover.    |
| `author`      | `String`        | Author name displayed below the title.   |
| `priceLabel`  | `String?`       | Text for the price overlay.              |
| `isPurchased` | `bool`          | Displays "Livre acheté" badge if true.   |
| `theme`       | `BookViewTheme` | Style customization object.              |
| `width`       | `double`        | Width of the book cover (default: 120).  |
| `height`      | `double`        | Height of the book cover (default: 180). |

### BookViewTheme Parameters

| Parameter             | Type       | Default              | Description                            |
| --------------------- | ---------- | -------------------- | -------------------------------------- |
| `spineGradient`       | `Gradient` | Linear (white/black) | Gradient effect on the left side.      |
| `spineLineWidth`      | `double`   | 0.5                  | Width of the decorative vertical line. |
| `spineLineColor`      | `Color`    | white (30%)          | Color of the decorative vertical line. |
| `showFrameLine`       | `bool`     | true                 | Toggles the decorative inner border.   |
| `frameLineColor`      | `Color`    | white (50%)          | Color of the decorative inner border.  |
| `borderRadius`        | `double`   | 2.0                  | Radius for the book corners.           |
| `shadowColor`         | `Color`    | black (25%)          | Color of the card shadow.              |
| `purchasedBadgeColor` | `Color`    | Gold                 | Background color for purchased badge.  |
| `priceBadgeColor`     | `Color`    | Black (60%)          | Background color for price badge.      |

---

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## 📄 License

MIT License - Copyright (c) 2026 Innocent Konan
