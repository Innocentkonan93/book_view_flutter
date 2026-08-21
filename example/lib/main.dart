import 'package:book_view_flutter/book_view_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookView Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BookGalleryPage(),
    );
  }
}

enum ViewMode { grid2, grid3, grid4, horizontal }

class BookGalleryPage extends StatefulWidget {
  const BookGalleryPage({super.key});

  @override
  State<BookGalleryPage> createState() => _BookGalleryPageState();
}

class _BookGalleryPageState extends State<BookGalleryPage> {
  ViewMode _selectedMode = ViewMode.grid2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Bibliothèque Réaliste'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
              left: 16.0,
              right: 16.0,
            ),
            child: SegmentedButton<ViewMode>(
              showSelectedIcon: false,
              style: ButtonStyle(
                side: WidgetStateProperty.all(BorderSide.none),
                visualDensity: VisualDensity.compact,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              segments: const [
                ButtonSegment<ViewMode>(
                  value: ViewMode.grid2,
                  label: Text('2x', style: TextStyle(fontSize: 12)),
                  icon: Icon(Icons.grid_view_rounded, size: 16),
                ),
                ButtonSegment<ViewMode>(
                  value: ViewMode.grid3,
                  label: Text('3x', style: TextStyle(fontSize: 12)),
                  icon: Icon(Icons.grid_on_rounded, size: 16),
                ),
                ButtonSegment<ViewMode>(
                  value: ViewMode.grid4,
                  label: Text('4x', style: TextStyle(fontSize: 12)),
                  icon: Icon(Icons.apps_rounded, size: 16),
                ),
                ButtonSegment<ViewMode>(
                  value: ViewMode.horizontal,
                  label: Text('List', style: TextStyle(fontSize: 12)),
                  icon: Icon(Icons.view_carousel_rounded, size: 16),
                ),
              ],
              selected: {_selectedMode},
              onSelectionChanged: (newSelection) {
                setState(() {
                  _selectedMode = newSelection.first;
                });
              },
            ),
          ),
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: _buildBody()),
    );
  }

  Widget _buildBody() {
    switch (_selectedMode) {
      case ViewMode.grid2:
        return _buildGrid(crossAxisCount: 2, aspectRatio: 0.6);
      case ViewMode.grid3:
        return _buildGrid(crossAxisCount: 3, aspectRatio: 0.55);
      case ViewMode.grid4:
        return _buildGrid(crossAxisCount: 4, aspectRatio: 0.5);
      case ViewMode.horizontal:
        return _buildHorizontalList();
    }
  }

  Widget _buildGrid({
    required int crossAxisCount,
    required double aspectRatio,
  }) {
    return GridView.builder(
      key: ValueKey('grid_$crossAxisCount'),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: aspectRatio,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return _buildBookWidget(books[index]);
      },
    );
  }

  Widget _buildHorizontalList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommandations pour vous',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 240,
          child: ListView.separated(
            key: const ValueKey('horizontal_list'),
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return SizedBox(
                width: 120,
                child: _buildBookWidget(books[index], width: 120, height: 170),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookWidget(
    BookData book, {
    double width = 120,
    double height = 180,
  }) {
    if (book.isAsset) {
      return BookView.asset(
        assetPath: book.imageUrl,
        title: book.title,
        author: book.author,
        priceLabel: book.price,
        purchasedLabel: 'Purchased', // Example of i18n
        isPurchased: book.isPurchased,
        readingProgress: book.readingProgress,
        ribbonText: book.ribbonText,
        width: width,
        height: height,
        onTap: () => _onBookTap(context, book),
      );
    }
    return BookView(
      imageUrl: book.imageUrl,
      title: book.title,
      author: book.author,
      priceLabel: book.price,
      purchasedLabel: 'Purchased', // Example of i18n
      isPurchased: book.isPurchased,
      readingProgress: book.readingProgress,
      ribbonText: book.ribbonText,
      width: width,
      height: height,
      onTap: () => _onBookTap(context, book),
    );
  }

  void _onBookTap(BuildContext context, BookData book) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Ouverture de : ${book.title}')));
  }
}

class BookData {
  final String title;
  final String author;
  final String imageUrl;
  final String? price;
  final bool isPurchased;
  final bool isAsset;
  final double? readingProgress;
  final String? ribbonText;

  BookData({
    required this.title,
    required this.author,
    required this.imageUrl,
    this.price,
    this.isPurchased = false,
    this.isAsset = false,
    this.readingProgress,
    this.ribbonText,
  });
}

final List<BookData> books = [
  BookData(
    title: 'Mon Livre Asset 1',
    author: 'Innocent K.',
    imageUrl: 'assets/images/1.jpg',
    price: '950 F',
    isAsset: true,
    ribbonText: 'NOUVEAU',
  ),
  BookData(
    title: 'Mon Livre Asset 2',
    author: 'Innocent K.',
    imageUrl: 'assets/images/2.jpg',
    isPurchased: true,
    isAsset: true,
    readingProgress: 0.35,
  ),
  BookData(
    title: 'L\'Art de la Guerre',
    author: 'Sun Tzu',
    imageUrl:
        'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300&auto=format&fit=crop',
    price: '1500 F',
    ribbonText: 'BESTSELLER',
  ),
  BookData(
    title: 'Clean Architecture',
    author: 'Robert C. Martin',
    imageUrl:
        'https://images.unsplash.com/photo-1589998059171-988d887df646?q=80&w=300&auto=format&fit=crop',
    isPurchased: true,
    readingProgress: 0.82,
  ),
  BookData(
    title: 'Design Patterns',
    author: 'Erich Gamma',
    imageUrl:
        'https://images.unsplash.com/photo-1532012197267-da84d127e765?q=80&w=300&auto=format&fit=crop',
    price: '2500 F',
  ),
  BookData(
    title: 'Flutter in Action',
    author: 'Eric Windmill',
    imageUrl:
        'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=300&auto=format&fit=crop',
    price: '1800 F',
    ribbonText: '-50%',
  ),
];
