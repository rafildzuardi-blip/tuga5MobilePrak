import 'package:flutter/material.dart';
import '../data/phone_data.dart';
import '../models/cart_item.dart';
import '../models/phone.dart';
import '../widgets/phone_card.dart';
import 'cart_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedBrand = 'Semua';
  String _keyword = '';
  final List<CartItem> _cart = [];

  int get _cartCount => _cart.fold(0, (sum, item) => sum + item.quantity);

  List<Phone> get _filteredPhones {
    return phoneList.where((p) {
      final matchBrand = _selectedBrand == 'Semua' || p.brand == _selectedBrand;
      final matchKeyword = p.name.toLowerCase().contains(_keyword.toLowerCase()) ||
          p.brand.toLowerCase().contains(_keyword.toLowerCase());
      return matchBrand && matchKeyword;
    }).toList();
  }

  void _openDetail(Phone phone) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailPage(
          phone: phone,
          onAddToCart: _addToCart,
        ),
      ),
    );
  }

  /// Tambah barang ke keranjang. Kalau HP + warna + penyimpanan sama, jumlahnya digabung.
  void _addToCart(CartItem newItem) {
    setState(() {
      final index = _cart.indexWhere((item) => item.isSameAs(newItem));
      if (index >= 0) {
        final item = _cart[index];
        item.quantity =
            (item.quantity + newItem.quantity).clamp(1, item.phone.stock).toInt();
      } else {
        _cart.add(newItem);
      }
    });
  }

  void _openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CartPage(
          cart: _cart,
          onChanged: () => setState(() {}),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final phones = _filteredPhones;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Header ----------
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 12, 0),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Halo, selamat datang 👋',
                            style: TextStyle(color: Colors.black54, fontSize: 13)),
                        SizedBox(height: 2),
                        Text('PhoneStore',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                  Badge(
                    isLabelVisible: _cartCount > 0,
                    label: Text('$_cartCount'),
                    child: IconButton.filledTonal(
                      onPressed: _openCart,
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                  ),
                ],
              ),
            ),

            // ---------- Search ----------
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: TextField(
                onChanged: (value) => setState(() => _keyword = value),
                decoration: InputDecoration(
                  hintText: 'Cari handphone...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // ---------- Filter merek ----------
            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                itemCount: brands.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final brand = brands[index];
                  final selected = brand == _selectedBrand;
                  return ChoiceChip(
                    label: Text(brand),
                    selected: selected,
                    showCheckmark: false,
                    selectedColor: const Color(0xFF1565C0),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onSelected: (_) => setState(() => _selectedBrand = brand),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
              child: Text(
                '${phones.length} produk ditemukan',
                style: const TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ),

            // ---------- Grid produk ----------
            Expanded(
              child: phones.isEmpty
                  ? const Center(child: Text('Produk tidak ditemukan'))
                  : GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: 0.66,
                      ),
                      itemCount: phones.length,
                      itemBuilder: (context, index) => PhoneCard(
                        key: ValueKey(phones[index].id),
                        phone: phones[index],
                        onTap: () => _openDetail(phones[index]),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}