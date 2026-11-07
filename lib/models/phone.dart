import 'package:flutter/material.dart';

/// Model data untuk satu produk handphone.
class Phone {
  final String id;
  final String name;
  final String brand;
  final String imageUrl;
  final Color themeColor; // warna khas produk (untuk background & aksen)
  final int price; // harga jual (Rupiah)
  final int originalPrice; // harga sebelum diskon
  final int stock;
  final double rating;
  final int sold;
  final int weightGram;
  final int warrantyMonths;
  final String description;
  final List<String> colors;
  final List<String> colorImages; // link foto untuk tiap warna (urutan sama dengan colors)
  final List<String> storageOptions;
  final PhoneSpec spec;

  const Phone({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.themeColor,
    required this.price,
    required this.originalPrice,
    required this.stock,
    required this.rating,
    required this.sold,
    required this.weightGram,
    required this.warrantyMonths,
    required this.description,
    required this.colors,
    this.colorImages = const [], // boleh dikosongkan
    required this.storageOptions,
    required this.spec,
  });

  /// Persentase diskon (0 jika tidak ada diskon).
  int get discountPercent {
    if (originalPrice <= price) return 0;
    return (((originalPrice - price) / originalPrice) * 100).round();
  }

  bool get isOutOfStock => stock == 0;
  bool get isLowStock => stock > 0 && stock <= 10;

  /// Ambil foto sesuai warna yang dipilih.
  /// Kalau foto warna itu belum diisi, pakai foto utama (imageUrl).
  String imageForColor(int index) {
    if (index < colorImages.length && colorImages[index].isNotEmpty) {
      return colorImages[index];
    }
    return imageUrl;
  }
}

/// Spesifikasi teknis handphone.
class PhoneSpec {
  final String screen;
  final String chipset;
  final String ram;
  final String camera;
  final String battery;
  final String os;

  const PhoneSpec({
    required this.screen,
    required this.chipset,
    required this.ram,
    required this.camera,
    required this.battery,
    required this.os,
  });
}