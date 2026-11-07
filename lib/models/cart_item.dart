import 'phone.dart';

/// Satu barang di dalam keranjang belanja.
class CartItem {
  final Phone phone;
  final String color;
  final String storage;
  int quantity;

  CartItem({
    required this.phone,
    required this.color,
    required this.storage,
    required this.quantity,
  });

  /// Total harga barang ini (harga x jumlah).
  int get subtotal => phone.price * quantity;

  /// Foto sesuai warna yang dipilih.
  String get image => phone.imageForColor(phone.colors.indexOf(color));

  /// Cek apakah barang ini sama (HP, warna, dan penyimpanan sama).
  bool isSameAs(CartItem other) =>
      phone.id == other.phone.id &&
      color == other.color &&
      storage == other.storage;
}