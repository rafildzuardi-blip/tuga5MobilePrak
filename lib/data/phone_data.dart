import 'package:flutter/material.dart';
import '../models/phone.dart';

/// Daftar merek untuk filter di halaman utama.
const List<String> brands = [
  'Semua',
  'Apple',
  'Samsung',
  'Xiaomi',
  'Oppo',
  'Vivo',
  'Realme',
  'Google',
  'Infinix',
  'Asus',
];

/// Data dummy produk handphone (gambar & deskripsi berbeda tiap produk).
const List<Phone> phoneList = [
  Phone(
    id: 'p01',
    name: 'iPhone 15 Pro',
    brand: 'Apple',
    imageUrl: 'https://th.bing.com/th/id/OIP.l-e8zEe3C8pLgEbi3YR_PAHaHa?w=209&h=209&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF5B5F66),
    price: 18999000,
    originalPrice: 20999000,
    stock: 12,
    rating: 4.9,
    sold: 1250,
    weightGram: 187,
    warrantyMonths: 12,
    description:
        'iPhone 15 Pro hadir dengan bodi titanium kelas aerospace yang lebih ringan '
        'namun tetap kokoh. Ditenagai chip A17 Pro, performa grafis meningkat drastis '
        'sehingga game kelas konsol bisa dimainkan dengan lancar. Tombol Action baru '
        'bisa diatur untuk membuka kamera, senter, atau pintasan favorit. Port USB-C '
        'dengan kecepatan USB 3 memudahkan transfer video ProRes berukuran besar.',
    colors: ['Natural Titanium', 'Blue Titanium', 'White Titanium', 'Black Titanium'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.usTv7TTegmHdk16lxmvwJgHaD4?w=345&h=181&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Natural Titanium
      'https://th.bing.com/th?id=OIF.gOSRmO8njXA8%2bJ02rKB%2bUA&w=187&h=187&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Blue Titanium
      'https://th.bing.com/th/id/OIF.mt5Mef5oMoQakUGlmlqjfw?w=208&h=208&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // White Titanium
      'https://th.bing.com/th/id/OIP.MCgJTRE0KP290O0vaf_F9QHaJM?w=161&h=200&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Black Titanium
    ],
    storageOptions: ['128 GB', '256 GB', '512 GB', '1 TB'],
    spec: PhoneSpec(
      screen: '6.1" Super Retina XDR OLED, 120Hz',
      chipset: 'Apple A17 Pro (3 nm)',
      ram: '8 GB',
      camera: '48 MP + 12 MP + 12 MP (3x zoom)',
      battery: '3274 mAh, 27W',
      os: 'iOS 17',
    ),
  ),
  Phone(
    id: 'p02',
    name: 'Galaxy S24 Ultra',
    brand: 'Samsung',
    imageUrl:
        'https://th.bing.com/th/id/OIP.khlK8Xcl99IngDOzo4D9IQHaHa?w=168&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF2E3A59),
    price: 19499000,
    originalPrice: 21999000,
    stock: 25,
    rating: 4.8,
    sold: 980,
    weightGram: 232,
    warrantyMonths: 12,
    description:
        'Samsung Galaxy S24 Ultra adalah flagship dengan fitur Galaxy AI seperti '
        'Circle to Search, Live Translate saat menelepon, dan Note Assist. Kamera '
        'utama 200 MP menghasilkan foto super detail, ditambah zoom optik 5x untuk '
        'memotret dari jauh. S Pen terintegrasi di dalam bodi, cocok untuk mencatat '
        'dan menggambar. Rangka titanium membuatnya lebih tahan banting.',
    colors: ['Titanium Gray', 'Titanium Black', 'Titanium Violet', 'Titanium Yellow'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.67P4CLNOPwSCPeCvKJ0_gQHaHd?w=182&h=183&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Titanium Gray
      'https://th.bing.com/th/id/OIP.KYLaaRTQ4bGXLczrjyu8EgHaHd?w=190&h=191&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Titanium Black
      'https://th.bing.com/th/id/OIF.33gwwndXXjL34N9qkgUrKQ?w=208&h=208&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Titanium Violet
      'https://th.bing.com/th/id/OIP.H-fVcA7JGrzueR6W_z5oUAHaHd?w=183&h=184&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Titanium Yellow
    ],
    storageOptions: ['256 GB', '512 GB', '1 TB'],
    spec: PhoneSpec(
      screen: '6.8" Dynamic AMOLED 2X, 120Hz',
      chipset: 'Snapdragon 8 Gen 3 for Galaxy',
      ram: '12 GB',
      camera: '200 MP + 50 MP + 12 MP + 10 MP',
      battery: '5000 mAh, 45W',
      os: 'Android 14, One UI 6.1',
    ),
  ),
  Phone(
    id: 'p03',
    name: 'Xiaomi 14',
    brand: 'Xiaomi',
    imageUrl: 'https://th.bing.com/th/id/OIP.dWvlcjYzfxPQ0asccMDfBQHaHa?w=179&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF3E7C59),
    price: 10999000,
    originalPrice: 11999000,
    stock: 40,
    rating: 4.7,
    sold: 2100,
    weightGram: 193,
    warrantyMonths: 15,
    description:
        'Xiaomi 14 membawa lensa Leica Summilux dalam bodi yang ringkas dan nyaman '
        'digenggam satu tangan. Snapdragon 8 Gen 3 memberikan performa kencang dan '
        'efisien, sementara pengisian daya 90W mampu mengisi baterai penuh dalam '
        'waktu sekitar 30 menit. Layar 1.5K yang terang tetap jelas di bawah sinar '
        'matahari.',
    colors: ['Jade Green', 'Black', 'White'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.hXAOLXUhQhIUOdmxKKoshAHaHa?w=209&h=209&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Jade Green
      'https://th.bing.com/th/id/OIF.oHsZd6xXVAOkJdxHNA6Lbg?w=179&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Black
      'https://th.bing.com/th/id/OIP.46xL4F8iEtfVEJcWlA-5ZQHaHa?w=181&h=181&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // White
    ],
    storageOptions: ['256 GB', '512 GB'],
    spec: PhoneSpec(
      screen: '6.36" LTPO OLED, 120Hz',
      chipset: 'Snapdragon 8 Gen 3',
      ram: '12 GB',
      camera: '50 MP + 50 MP + 50 MP (Leica)',
      battery: '4610 mAh, 90W',
      os: 'Android 14, HyperOS',
    ),
  ),
  Phone(
    id: 'p04',
    name: 'Oppo Reno11 5G',
    brand: 'Oppo',
    imageUrl: 'https://th.bing.com/th/id/OIP.-6jJZE_MeFJdl3vm9Ev2-AHaHa?w=209&h=209&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF3A6EA5),
    price: 5999000,
    originalPrice: 6499000,
    stock: 8,
    rating: 4.6,
    sold: 1540,
    weightGram: 184,
    warrantyMonths: 12,
    description:
        'Oppo Reno11 5G dirancang untuk pecinta foto potret. Kamera telefoto 32 MP '
        'menghasilkan efek bokeh alami layaknya kamera profesional. Desainnya tipis '
        'dengan motif permukaan yang elegan, dan layar melengkung 120Hz membuat '
        'pengalaman scrolling terasa mulus.',
    colors: ['Wave Green', 'Rock Grey'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.nSPLlofNJZzwmuNx-lxx7QHaHa?w=197&h=197&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Wave Green
      'https://th.bing.com/th/id/OIP.ZG-3AwiCakF2j1JyX4k9WAHaHa?w=187&h=188&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Rock Grey
    ],
    storageOptions: ['256 GB', '512 GB'],
    spec: PhoneSpec(
      screen: '6.7" AMOLED melengkung, 120Hz',
      chipset: 'MediaTek Dimensity 7050',
      ram: '8 GB',
      camera: '50 MP + 32 MP (tele) + 8 MP',
      battery: '5000 mAh, 67W',
      os: 'Android 14, ColorOS 14',
    ),
  ),
  Phone(
    id: 'p05',
    name: 'Vivo V30',
    brand: 'Vivo',
    imageUrl: 'https://th.bing.com/th/id/OIP.-egh2GwNDzcESl6-g2i5wgHaHa?w=199&h=199&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF6A4C93),
    price: 5799000,
    originalPrice: 5999000,
    stock: 30,
    rating: 4.5,
    sold: 870,
    weightGram: 186,
    warrantyMonths: 12,
    description:
        'Vivo V30 menonjolkan fitur Aura Light Portrait 3.0 yang menghasilkan '
        'pencahayaan lembut saat memotret di malam hari. Kamera depan 50 MP dengan '
        'autofokus siap untuk selfie dan video call yang tajam. Bodi tipis 7.45 mm '
        'dengan baterai 5000 mAh menjamin pemakaian seharian.',
    colors: ['Andaman Blue', 'Bloom White', 'Noble Black'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.KhgKtmYxcFcBhTxR0CwolAHaHa?w=186&h=186&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Andaman Blue
      'https://th.bing.com/th/id/OIP.4gs91CSfhzzL_xN8xvamFgHaHa?w=179&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Bloom White
      'https://th.bing.com/th/id/OIP.oZ9hBWacdGIJc9aFioL2TAHaHa?w=184&h=184&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Noble Black
    ],
    storageOptions: ['256 GB', '512 GB'],
    spec: PhoneSpec(
      screen: '6.78" AMOLED melengkung, 120Hz',
      chipset: 'Snapdragon 7 Gen 3',
      ram: '12 GB',
      camera: '50 MP + 50 MP, depan 50 MP',
      battery: '5000 mAh, 80W',
      os: 'Android 14, Funtouch OS 14',
    ),
  ),
  Phone(
    id: 'p06',
    name: 'Realme 12 Pro+',
    brand: 'Realme',
    imageUrl: 'https://th.bing.com/th/id/OIP.Yar5fHko1hGBkQn7HclrOQHaHa?w=179&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF1F4E79),
    price: 6299000,
    originalPrice: 6999000,
    stock: 0,
    rating: 4.6,
    sold: 1320,
    weightGram: 196,
    warrantyMonths: 12,
    description:
        'Realme 12 Pro+ hadir dengan desain jam tangan mewah berbahan kulit vegan. '
        'Kamera periskop 64 MP mendukung zoom optik 3x hingga 120x digital, jarang '
        'ditemui di kelas harganya. Cocok untuk kamu yang ingin tampil gaya sekaligus '
        'punya kamera zoom andal.',
    colors: ['Submarine Blue', 'Navigator Beige'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.w2PD4G-JJHFHZEAc3N1SzwHaGX?w=206&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Submarine Blue
      'https://th.bing.com/th/id/OIP.Bg9rMQjYc93XAR6dhKYpNgHaIl?w=159&h=184&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Navigator Beige
    ],
    storageOptions: ['256 GB', '512 GB'],
    spec: PhoneSpec(
      screen: '6.7" OLED melengkung, 120Hz',
      chipset: 'Snapdragon 7s Gen 2',
      ram: '12 GB',
      camera: '50 MP + 64 MP periskop + 8 MP',
      battery: '5000 mAh, 67W',
      os: 'Android 14, Realme UI 5.0',
    ),
  ),
  Phone(
    id: 'p07',
    name: 'Pixel 8 Pro',
    brand: 'Google',
    imageUrl: 'https://th.bing.com/th/id/OIP.kX90Bcyv9863fnTNq_WQBAHaEK?w=274&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF4A7C8C),
    price: 14999000,
    originalPrice: 15999000,
    stock: 5,
    rating: 4.7,
    sold: 420,
    weightGram: 213,
    warrantyMonths: 12,
    description:
        'Google Pixel 8 Pro membawa kecerdasan Google langsung ke genggaman. Fitur '
        'Magic Editor dan Best Take memudahkan mengedit foto hanya dengan beberapa '
        'ketukan. Chip Tensor G3 mengoptimalkan fitur AI, dan Google menjanjikan '
        'pembaruan Android selama 7 tahun.',
    colors: ['Obsidian', 'Porcelain', 'Bay'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.yaL7AxJGKzibWYFo75XRiQHaHa?w=183&h=183&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Obsidian
      'https://th.bing.com/th/id/OIP.WDbHdOSZjAmOsEcCJJZXxQHaHa?w=178&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Porcelain
      'https://th.bing.com/th/id/OIP.qzdA0EhXvYAoyHh_w6dg5AHaIy?w=154&h=183&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Bay
    ],
    storageOptions: ['128 GB', '256 GB', '512 GB'],
    spec: PhoneSpec(
      screen: '6.7" LTPO OLED, 120Hz',
      chipset: 'Google Tensor G3',
      ram: '12 GB',
      camera: '50 MP + 48 MP + 48 MP (5x zoom)',
      battery: '5050 mAh, 30W',
      os: 'Android 14',
    ),
  ),
  Phone(
    id: 'p08',
    name: 'Infinix Note 40 Pro',
    brand: 'Infinix',
    imageUrl: 'https://th.bing.com/th/id/OIP.1kLSwcRxlbI7EFqIdf_k7QHaHa?w=209&h=209&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF8C6A3F),
    price: 3199000,
    originalPrice: 3499000,
    stock: 60,
    rating: 4.4,
    sold: 3150,
    weightGram: 190,
    warrantyMonths: 12,
    description:
        'Infinix Note 40 Pro menawarkan fitur premium di harga terjangkau. Mendukung '
        'pengisian daya nirkabel magnetik MagCharge dan fast charging 70W. Layar AMOLED '
        'melengkung 120Hz serta speaker ganda JBL membuat pengalaman menonton film '
        'jadi lebih seru.',
    colors: ['Vintage Green', 'Titan Gold', 'Racing Black'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.x0x1cB3yAqbKSkdq9ylPiAHaHa?w=175&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Vintage Green
      'https://th.bing.com/th/id/OIP.9YgdmdVbUCWpNRflsfEyNgHaJj?w=147&h=189&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Titan Gold
      'https://th.bing.com/th/id/OIP.8VGMnGCmdVlLiP4s7fPahgHaHa?w=175&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Racing Black
    ],
    storageOptions: ['256 GB'],
    spec: PhoneSpec(
      screen: '6.78" AMOLED melengkung, 120Hz',
      chipset: 'MediaTek Helio G99 Ultimate',
      ram: '8 GB (+8 GB extended)',
      camera: '108 MP + 2 MP + 2 MP',
      battery: '5000 mAh, 70W',
      os: 'Android 14, XOS 14',
    ),
  ),
  Phone(
    id: 'p09',
    name: 'ROG Phone 8',
    brand: 'Asus',
    imageUrl: 'https://th.bing.com/th/id/OIP.XMyViK9LR2XJAFwKjxy_8gHaHa?w=179&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFF8B1E2D),
    price: 13999000,
    originalPrice: 14999000,
    stock: 15,
    rating: 4.8,
    sold: 610,
    weightGram: 225,
    warrantyMonths: 24,
    description:
        'Asus ROG Phone 8 adalah HP gaming dengan layar 165Hz dan tombol AirTrigger '
        'yang responsif. Sistem pendingin GameCool 8 menjaga suhu tetap stabil saat '
        'bermain lama. Kini desainnya lebih ramping, tahan air IP68, dan dilengkapi '
        'kamera gimbal 50 MP sehingga nyaman dipakai sehari-hari.',
    colors: ['Phantom Black', 'Rebel Grey'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.Igme_io_pOlBL4CZ8-dKHQHaHa?w=196&h=196&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Phantom Black
      'https://th.bing.com/th/id/OIP.dX9lAWPrccwCcGzu0gpx2AHaHa?w=172&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Rebel Grey
    ],
    storageOptions: ['256 GB', '512 GB'],
    spec: PhoneSpec(
      screen: '6.78" LTPO AMOLED, 165Hz',
      chipset: 'Snapdragon 8 Gen 3',
      ram: '12 GB',
      camera: '50 MP gimbal + 32 MP + 13 MP',
      battery: '5500 mAh, 65W',
      os: 'Android 14, ROG UI',
    ),
  ),
  Phone(
    id: 'p10',
    name: 'Poco X6 Pro',
    brand: 'Xiaomi',
    imageUrl: 'https://th.bing.com/th/id/OIP.B8dDzlp15x0FO65uoGZG3AHaHa?w=209&h=209&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
    themeColor: Color(0xFFB8860B),
    price: 4299000,
    originalPrice: 4999000,
    stock: 3,
    rating: 4.6,
    sold: 2780,
    weightGram: 186,
    warrantyMonths: 15,
    description:
        'Poco X6 Pro adalah raja performa di kelas menengah berkat chipset Dimensity '
        '8300-Ultra. Skor benchmark-nya mampu menyaingi HP flagship. Layar 1.5K '
        'AMOLED dengan kecerahan tinggi dan pengisian daya 67W menjadikannya pilihan '
        'tepat untuk gamer dengan budget terbatas.',
    colors: ['Poco Yellow', 'Black', 'Grey'],
    // Paste link foto tiap warna (urutan sama dengan colors). Kosong = pakai imageUrl.
    colorImages: [
      'https://th.bing.com/th/id/OIP.B3MNCkAfxIaHwS2YYbMU3QHaIg?w=175&h=200&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Poco Yellow
      'https://th.bing.com/th/id/OIP.E4nrthRDEKnn5Tq6wFMmvAHaHa?w=187&h=187&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Black
      'https://th.bing.com/th/id/OIP.BFKGziJkdqMqfVRTbmV17gHaHa?w=185&h=185&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3', // Grey
    ],
    storageOptions: ['256 GB', '512 GB'],
    spec: PhoneSpec(
      screen: '6.67" Flow AMOLED 1.5K, 120Hz',
      chipset: 'MediaTek Dimensity 8300-Ultra',
      ram: '12 GB',
      camera: '64 MP + 8 MP + 2 MP',
      battery: '5000 mAh, 67W',
      os: 'Android 14, HyperOS',
    ),
  ),
];