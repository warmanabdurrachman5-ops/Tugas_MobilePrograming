import 'package:flutter/material.dart';

class Hitung  extends ChangeNotifier{
  //siapkan nilaii variabel yang nilaoinya akan di bagikan antar halaman
  //set modifer nya ke private dengan tangga_
  int _angka = 0;
  //buat methode geeter
  int get angka => _angka;
  //buat methode untuk menambah angka +1
  void tambah(){
    _angka++;
    notifyListeners();
  }
  void kurang(){
    _angka--;
    notifyListeners();
  }
}