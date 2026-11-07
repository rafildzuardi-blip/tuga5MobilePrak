import 'package:flutter/material.dart';
import '../models/phone.dart';

/// Menampilkan gambar produk (dari link internet atau dari folder assets).
/// Jika gambar gagal dimuat, tampil ikon HP berwarna sesuai tema produk.
class PhoneImage extends StatelessWidget {
  final Phone phone;
  final String? url; // link foto lain (misal foto per warna)
  final double iconSize;

  const PhoneImage({super.key, required this.phone, this.url, this.iconSize = 60});

  @override
  Widget build(BuildContext context) {
    final imageUrl = url ?? phone.imageUrl;

    // Gambar dari internet
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        key: ValueKey(imageUrl),
        fit: BoxFit.contain,
        // Supaya gambar dari situs lain tetap tampil di Flutter Web (Chrome/Edge)
        webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      );
    }

    // Gambar dari folder assets
    return Image.asset(
      imageUrl,
      key: ValueKey(imageUrl),
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => _placeholder(),
    );
  }

  Widget _placeholder() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.smartphone_rounded, size: iconSize, color: phone.themeColor),
          const SizedBox(height: 6),
          Text(
            phone.brand,
            style: TextStyle(
              color: phone.themeColor,
              fontWeight: FontWeight.bold,
              fontSize: iconSize * 0.22,
            ),
          ),
        ],
      ),
    );
  }
}