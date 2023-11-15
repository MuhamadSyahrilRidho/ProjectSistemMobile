import 'package:flutter/material.dart';

class DesainHalamanUtama extends StatefulWidget {
  const DesainHalamanUtama({Key? key}) : super(key: key);

  @override
  State<DesainHalamanUtama> createState() => DesainHalamanUtamaState();
}

class DesainHalamanUtamaState extends State<DesainHalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
        backgroundColor: Colors.black, // Mengubah warna latar belakang AppBar menjadi hitam
      ),
    );
  }
}