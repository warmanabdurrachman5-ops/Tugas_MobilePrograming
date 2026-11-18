import 'package:flutter/material.dart';

class KeranjangProvider extends ChangeNotifier {
final List<String> _item = [];

//methode untuk mendapatkan item keranjang

List<String> get items => _item;
//method untuk mendapatkan jumlah item di keranjang

int get jumlahIitem => _item.length;

void tembahItem(String namaProduk ) {
  _item.add(namaProduk);
  notifyListeners();
}
void hapusItem(int noProduk){
  _item.removeAt(noProduk);
  notifyListeners();
}

void kosongkan() {
  _item.clear(); // Tanpa parameter
  notifyListeners();
}

}
