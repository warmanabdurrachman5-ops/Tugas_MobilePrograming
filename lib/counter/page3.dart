import 'package:flutter/material.dart';
import 'package:pertemuan_baru/counter/hitung.dart';
import 'package:provider/provider.dart';

class Page3 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              context.read<Hitung>().angka.toString()
            ),
            SizedBox(height: 10),
            Text("Ini Data Dari Page 2"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("kembali ke halaman 2"),
            ),
          ],
        ),
      ),
    );
  }
}
