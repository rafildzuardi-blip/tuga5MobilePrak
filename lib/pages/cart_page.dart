import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../utils/formatter.dart';
import '../widgets/phone_image.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cart;
  final VoidCallback onChanged; // memberi tahu HomePage kalau isi keranjang berubah

  const CartPage({super.key, required this.cart, required this.onChanged});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> get cart => widget.cart;

  int get _totalPrice => cart.fold(0, (sum, item) => sum + item.subtotal);
  int get _totalItems => cart.fold(0, (sum, item) => sum + item.quantity);

  void _update(VoidCallback action) {
    setState(action);
    widget.onChanged();
  }

  void _changeQty(CartItem item, int delta) {
    final newQty = item.quantity + delta;
    if (newQty < 1 || newQty > item.phone.stock) return;
    _update(() => item.quantity = newQty);
  }

  void _remove(CartItem item) {
    _update(() => cart.remove(item));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('${item.phone.name} dihapus dari keranjang'),
        ),
      );
  }

  void _checkout() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 56),
        title: const Text('Pesanan Berhasil!'),
        content: Text(
          'Terima kasih, $_totalItems barang dengan total '
          '${formatRupiah(_totalPrice)} sedang diproses.',
          textAlign: TextAlign.center,
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext); // tutup dialog
              _update(() => cart.clear());
              Navigator.pop(context); // kembali ke halaman utama
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text('Keranjang Saya',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: cart.isEmpty ? _buildEmpty() : _buildList(),
      bottomNavigationBar: cart.isEmpty ? null : _buildBottomBar(),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 90, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          const Text('Keranjang masih kosong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('Yuk, pilih HP favoritmu dulu!',
              style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.storefront),
            label: const Text('Mulai Belanja'),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: cart.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = cart[index];
        final phone = item.phone;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar
              Container(
                width: 84,
                height: 84,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: phone.themeColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: PhoneImage(
                  key: ValueKey('${phone.id}-${item.color}'),
                  phone: phone,
                  url: item.image,
                  iconSize: 36,
                ),
              ),
              const SizedBox(width: 12),

              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            phone.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () => _remove(item),
                          child: const Icon(Icons.delete_outline,
                              color: Colors.redAccent, size: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${item.color} • ${item.storage}',
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            formatRupiah(item.subtotal),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1565C0),
                            ),
                          ),
                        ),
                        // Pengatur jumlah
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              _qtyButton(Icons.remove, () => _changeQty(item, -1)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('${item.quantity}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ),
                              _qtyButton(Icons.add, () => _changeQty(item, 1)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, size: 16),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, -2)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total ($_totalItems barang)',
                      style: const TextStyle(color: Colors.black54, fontSize: 12)),
                  Text(
                    formatRupiah(_totalPrice),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: _checkout,
                icon: const Icon(Icons.payment),
                label: const Text('Checkout',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}