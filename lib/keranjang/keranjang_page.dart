import 'package:flutter/material.dart';
import 'package:pertemuan_baru/keranjang/keranjang_provider.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  // static const List<String> _itemKeranjang = [
  //   'Buku Flutter Dasar',
  //   'Kopi Susu Kampus',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi Keranjang'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<KeranjangProvider>().kosongkan();
            },
            child: const Text('Kosongkan'),
          ),
        ],
      ),
      body: Consumer<KeranjangProvider>(
        builder: (context, keranjang, child) {
          return keranjang.jumlahIitem == 0
              ? const Center(
                  child: Text(
                    'Keranjang masih kosong',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: keranjang.jumlahIitem,
                  itemBuilder: (context, index) {
                    final namaProduk = keranjang.items[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(namaProduk),
                        trailing: IconButton(
                          tooltip: 'Hapus item',
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            context.read<KeranjangProvider>().hapusItem(index);
                          },
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
