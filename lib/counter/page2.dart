import 'package:flutter/material.dart';
import 'package:pertemuan_baru/counter/hitung.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Consumer<Hitung>(
              builder: (context, value, child) {
                return Text(
                  context.read<Hitung>().angka.toString(),
                  style: TextStyle(fontSize: 28, fontWeight: .bold),
                );
                // Text('.angka.totring',style: TextStyle(fontSize: 28, fontWeight: .bold),);
              },
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<Hitung>().kurang();
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    context.read<Hitung>().tambah();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
              },
              child: Text("Ke Halaman 3"),
            ),
          ],
        ),
      ),
    );
  }
}
