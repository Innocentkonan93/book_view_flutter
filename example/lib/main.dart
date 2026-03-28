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

class BookGalleryPage extends StatelessWidget {
  const BookGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Bibliothèque Réaliste'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 0.65,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 1,
          itemBuilder: (context, index) {
            final book = books[index];
            return BookView(
              imageUrl: book.imageUrl,
              title: book.title,
              author: book.author,
              priceLabel: book.price,
              isPurchased: book.isPurchased,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ouverture de : ${book.title}')),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class BookData {
  final String title;
  final String author;
  final String imageUrl;
  final String? price;
  final bool isPurchased;

  BookData({
    required this.title,
    required this.author,
    required this.imageUrl,
    this.price,
    this.isPurchased = false,
  });
}

final List<BookData> books = [
  BookData(
    title: 'L\'Art de la Guerre',
    author: 'Sun Tzu',
    imageUrl:
        'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300&auto=format&fit=crop',
    price: '1500 F',
  ),
  BookData(
    title: 'Clean Architecture',
    author: 'Robert C. Martin',
    imageUrl:
        'https://images.unsplash.com/photo-1589998059171-988d887df646?q=80&w=300&auto=format&fit=crop',
    isPurchased: true,
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
  ),
];
