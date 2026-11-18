import 'package:flutter/material.dart';

class RestoProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _pesanan = [];

  // Getter daftar pesanan
  List<Map<String, dynamic>> get pesanan => _pesanan;

  // Getter total jumlah item
  int get totalItemPesanan {
    int total = 0;

    for (var item in _pesanan) {
      total += int.parse(item['jumlah'].toString());
    }

    return total;
  }

  // Getter total harga
  int get totalBayar {
    int total = 0;

    for (var item in _pesanan) {
      total += int.parse(item['subtotal'].toString());
    }

    return total;
  }

  // Menambahkan menu ke pesanan
  void tambahPesanan(Map<String, dynamic> item) {
    final index = _pesanan.indexWhere(
      (pesanan) => pesanan['id'] == item['id'],
    );

    if (index != -1) {
      int jumlah = int.parse(_pesanan[index]['jumlah'].toString());
      int harga = int.parse(_pesanan[index]['harga'].toString());

      jumlah++;

      _pesanan[index]['jumlah'] = jumlah.toString();
      _pesanan[index]['subtotal'] = (jumlah * harga).toString();
    } else {
      _pesanan.add({
        'id': item['id'],
        'jumlah': '1',
        'harga': item['harga'].toString(),
        'subtotal': item['harga'].toString(),
      });
    }

    notifyListeners();
  }

  // Menghapus satu menu dari pesanan
  void hapusItemPesanan(String id) {
    _pesanan.removeWhere((item) => item['id'] == id);

    notifyListeners();
  }

  // Mengosongkan seluruh pesanan
  void kosongkanPesanan() {
    _pesanan.clear();

    notifyListeners();
  }
}

