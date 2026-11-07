import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/phone.dart';
import '../utils/formatter.dart';
import '../widgets/phone_image.dart';

class DetailPage extends StatefulWidget {
  final Phone phone;
  final void Function(CartItem item) onAddToCart;

  const DetailPage({super.key, required this.phone, required this.onAddToCart});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedColor = 0;
  int _selectedStorage = 0;
  int _quantity = 1;
  bool _isFavorite = false;
  bool _showFullDesc = false;

  Phone get phone => widget.phone;

  void _changeQty(int delta) {
    final newQty = _quantity + delta;
    if (newQty < 1 || newQty > phone.stock) return;
    setState(() => _quantity = newQty);
  }

  void _addToCart() {
    widget.onAddToCart(
      CartItem(
        phone: phone,
        color: phone.colors[_selectedColor],
        storage: phone.storageOptions[_selectedStorage],
        quantity: _quantity,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: phone.themeColor,
          content: Text(
            '$_quantity x ${phone.name} (${phone.colors[_selectedColor]}, '
            '${phone.storageOptions[_selectedStorage]}) masuk keranjang',
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: phone.themeColor.withOpacity(0.08),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderInfo(),
                  const SizedBox(height: 16),
                  _buildPrice(),
                  const SizedBox(height: 16),
                  _buildStock(),
                  const SizedBox(height: 16),
                  _buildQuickInfo(),
                  const SizedBox(height: 24),
                  _sectionTitle('Pilih Warna: ${phone.colors[_selectedColor]}'),
                  _buildOptions(phone.colors, _selectedColor,
                      (i) => setState(() => _selectedColor = i)),
                  const SizedBox(height: 20),
                  _sectionTitle('Pilih Penyimpanan'),
                  _buildOptions(phone.storageOptions, _selectedStorage,
                      (i) => setState(() => _selectedStorage = i)),
                  const SizedBox(height: 24),
                  _sectionTitle('Spesifikasi'),
                  _buildSpecs(),
                  const SizedBox(height: 24),
                  _sectionTitle('Deskripsi Produk'),
                  _buildDescription(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  // ================= APP BAR + GAMBAR =================
  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 340,
      pinned: true,
      elevation: 0,
      backgroundColor: phone.themeColor,
      foregroundColor: Colors.white,
      title: Text(phone.name),
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.redAccent : Colors.black87,
                size: 20,
              ),
              onPressed: () => setState(() => _isFavorite = !_isFavorite),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [phone.themeColor, phone.themeColor.withOpacity(0.35)],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(40, 100, 40, 30),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 8)),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Hero(
              tag: 'phone-${phone.id}',
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: PhoneImage(
                  key: ValueKey(_selectedColor),
                  phone: phone,
                  url: phone.imageForColor(_selectedColor),
                  iconSize: 90,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= NAMA, MEREK, RATING =================
  Widget _buildHeaderInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: phone.themeColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                phone.brand,
                style: TextStyle(
                  color: phone.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const Spacer(),
            const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
            Text(' ${phone.rating}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('  (${formatSold(phone.sold)} terjual)',
                style: const TextStyle(color: Colors.black54, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          phone.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }

  // ================= HARGA =================
  Widget _buildPrice() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          formatRupiah(phone.price),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(width: 10),
        if (phone.discountPercent > 0) ...[
          Text(
            formatRupiah(phone.originalPrice),
            style: const TextStyle(
              color: Colors.black45,
              decoration: TextDecoration.lineThrough,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '-${phone.discountPercent}%',
              style: const TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ],
    );
  }

  // ================= STOK =================
  Widget _buildStock() {
    final Color statusColor;
    final String statusText;
    if (phone.isOutOfStock) {
      statusColor = Colors.red;
      statusText = 'Stok habis';
    } else if (phone.isLowStock) {
      statusColor = Colors.orange;
      statusText = 'Hampir habis! Sisa ${phone.stock} unit';
    } else {
      statusColor = Colors.green;
      statusText = 'Tersedia ${phone.stock} unit';
    }

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.inventory_2_outlined, color: statusColor, size: 20),
              const SizedBox(width: 8),
              Text(
                statusText,
                style: TextStyle(color: statusColor, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: (phone.stock / 60).clamp(0.0, 1.0),
              minHeight: 7,
              color: statusColor,
              backgroundColor: statusColor.withOpacity(0.15),
            ),
          ),
        ],
      ),
    );
  }

  // ================= INFO SINGKAT (berat, garansi, kirim) =================
  Widget _buildQuickInfo() {
    return Row(
      children: [
        _infoTile(Icons.scale_outlined, 'Berat', '${phone.weightGram} g'),
        const SizedBox(width: 10),
        _infoTile(Icons.verified_user_outlined, 'Garansi', '${phone.warrantyMonths} bln'),
        const SizedBox(width: 10),
        _infoTile(Icons.local_shipping_outlined, 'Kirim', 'Gratis'),
      ],
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6FA),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, color: phone.themeColor),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.black54)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // ================= PILIHAN WARNA / PENYIMPANAN =================
  Widget _buildOptions(List<String> options, int selected, ValueChanged<int> onSelect) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(options.length, (i) {
        final isSelected = i == selected;
        return ChoiceChip(
          label: Text(options[i]),
          selected: isSelected,
          showCheckmark: false,
          selectedColor: phone.themeColor,
          backgroundColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
          side: BorderSide(
            color: isSelected ? phone.themeColor : Colors.black12,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onSelected: (_) => onSelect(i),
        );
      }),
    );
  }

  // ================= SPESIFIKASI =================
  Widget _buildSpecs() {
    final specs = [
      (Icons.phone_android, 'Layar', phone.spec.screen),
      (Icons.memory, 'Chipset', phone.spec.chipset),
      (Icons.developer_board, 'RAM', phone.spec.ram),
      (Icons.camera_alt_outlined, 'Kamera', phone.spec.camera),
      (Icons.battery_charging_full, 'Baterai', phone.spec.battery),
      (Icons.android, 'Sistem Operasi', phone.spec.os),
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 84,
      ),
      itemBuilder: (context, i) {
        final (icon, label, value) = specs[i];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F6FA),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: phone.themeColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: phone.themeColor),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: const TextStyle(fontSize: 11, color: Colors.black54)),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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

  // ================= DESKRIPSI =================
  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          alignment: Alignment.topCenter,
          child: Text(
            phone.description,
            maxLines: _showFullDesc ? null : 3,
            overflow: _showFullDesc ? TextOverflow.visible : TextOverflow.ellipsis,
            style: const TextStyle(height: 1.6, color: Colors.black87),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () => setState(() => _showFullDesc = !_showFullDesc),
          child: Text(
            _showFullDesc ? 'Tampilkan lebih sedikit' : 'Baca selengkapnya',
            style: TextStyle(color: phone.themeColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // ================= BAR BAWAH (jumlah + tombol) =================
  Widget _buildBottomBar() {
    final total = phone.price * _quantity;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
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
            // Pengatur jumlah
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, size: 18),
                    onPressed: phone.isOutOfStock ? null : () => _changeQty(-1),
                  ),
                  Text(
                    phone.isOutOfStock ? '0' : '$_quantity',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, size: 18),
                    onPressed: phone.isOutOfStock ? null : () => _changeQty(1),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Tombol tambah ke keranjang
            Expanded(
              child: SizedBox(
                height: 52,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: phone.themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: phone.isOutOfStock ? null : _addToCart,
                  child: phone.isOutOfStock
                      ? const Text('Stok Habis')
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('+ Keranjang',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(formatRupiah(total),
                                style: const TextStyle(fontSize: 11)),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}