
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pertemuan_baru/tugas/menu_resto.dart';
import 'package:pertemuan_baru/tugas/nota_pesanan.dart';
import 'package:pertemuan_baru/tugas/resto_provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RestoProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resto Kampus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/menu-resto',
      routes: {
        '/menu-resto': (context) => const MenuRestoPage(),
        '/pesanan-resto': (context) => const NotaPesananPage(),
      },
    );
  }
}
