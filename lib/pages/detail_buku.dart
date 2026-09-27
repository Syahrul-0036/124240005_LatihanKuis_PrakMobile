import 'package:flutter/material.dart';
import 'package:latihan_kuis/model/bookModels.dart';

class DetailBukuPage extends StatelessWidget {
  const DetailBukuPage({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        book.imageUrl,
                        height: 280,
                        width: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          height: 280,
                          width: 200,
                          color: const Color(0xFFE7EFED),
                          child: const Icon(Icons.menu_book, size: 64),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    book.author,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  _DetailRow(label: 'Tahun terbit', value: '${book.year}'),
                  _DetailRow(label: 'Genre', value: book.genre),
                  _DetailRow(label: 'Penerbit', value: book.publisher),
                  _DetailRow(label: 'Jumlah halaman', value: '${book.pages}'),
                  _DetailRow(label: 'Rating', value: '${book.rating} / 5'),
                  const SizedBox(height: 24),
                  Text(
                    'Deskripsi',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(book.description, textAlign: TextAlign.justify),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 12, child: Text(':')),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
