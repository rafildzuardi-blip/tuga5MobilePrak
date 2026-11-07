import 'package:flutter/material.dart';
import '../models/phone.dart';
import '../utils/formatter.dart';
import 'phone_image.dart';

/// Kartu produk yang tampil di grid halaman utama.
class PhoneCard extends StatelessWidget {
  final Phone phone;
  final VoidCallback onTap;

  const PhoneCard({super.key, required this.phone, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      elevation: 2,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Gambar ----------
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: phone.themeColor.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Hero(
                      tag: 'phone-${phone.id}',
                      child: PhoneImage(phone: phone, iconSize: 48),
                    ),
                  ),
                  if (phone.discountPercent > 0)
                    Positioned(
                      top: 14,
                      left: 14,
                      child: _badge('-${phone.discountPercent}%', Colors.redAccent),
                    ),
                  if (phone.isOutOfStock)
                    Positioned(
                      top: 14,
                      right: 14,
                      child: _badge('Habis', Colors.black87),
                    ),
                ],
              ),
            ),

            // ---------- Info ----------
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phone.brand.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w700,
                      color: phone.themeColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    phone.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatRupiah(phone.price),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, size: 15, color: Colors.amber),
                      Text(' ${phone.rating}', style: const TextStyle(fontSize: 11)),
                      Text(
                        '  •  ${formatSold(phone.sold)} terjual',
                        style: const TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}