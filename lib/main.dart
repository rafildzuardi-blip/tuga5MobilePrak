import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const PhoneStoreApp());
}

class PhoneStoreApp extends StatelessWidget {
  const PhoneStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhoneStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1565C0),
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
      ),
      home: const HomePage(),
    );
  }
}
