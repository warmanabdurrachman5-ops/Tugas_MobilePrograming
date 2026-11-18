import 'package:flutter/material.dart';
import 'package:pertemuan_baru/tugas/menu_resto.dart';
import 'package:provider/provider.dart';
import 'package:pertemuan_baru/tugas/resto_provider.dart';

class NotaPesananPage extends StatelessWidget {
  const NotaPesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota Pesanan'),
        actions: [
          TextButton(
            onPressed: () {
              context.read<RestoProvider>().kosongkanPesanan();
            },
            child: const Text('Reset'),
          ),
        ],
      ),
      body: Consumer<RestoProvider>(
        builder: (context, provider, child) {
          final pesanan = provider.pesanan;

          if (pesanan.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada pesanan yang dipilih',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: pesanan.length,
                  itemBuilder: (context, index) {
                    final p = pesanan[index];

                    final jumlah = int.parse(p['jumlah'].toString());

                    final harga = int.parse(p['harga'].toString());

                    final subtotal = int.parse(p['subtotal'].toString());

                    final menu = MenuRestoPage.menuItems.firstWhere(
                      (item) => item['id'] == p['id'],
                    );

                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text(menu['nama']),
                        subtitle: Text(
                          'Jumlah: $jumlah x Rp $harga = Rp $subtotal',
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            context.read<RestoProvider>().hapusItemPesanan(
                              p['id'].toString(),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Bagian total pembayaran
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: Border(
                    top: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Bayar:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rp ${provider.totalBayar}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
