import 'package:flutter/material.dart';

class DesainHalamanUtama extends StatefulWidget {
  const DesainHalamanUtama({Key? key}) : super(key: key);

  @override
  State<DesainHalamanUtama> createState() => DesainHalamanUtamaState();
}

class DesainHalamanUtamaState extends State<DesainHalamanUtama> {
  // Daftar produk 
  List<String> productList = List.generate(20, (index) => 'Produk ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${index + 1}'), // Menampilkan indeks produk
            title: Text(productList[index]),
            subtitle: Text('Deskripsi ${productList[index]}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Menghandle aksi hapus 
                _deleteProduct(index);
              },
            ),
            onTap: () {
              // Menghandle aksi tap
              _showDetails(productList[index]);
            },
          );
        },
      ),
    );
  }

  // Fungsi untuk menghapus produk
  void _deleteProduct(int index) {
    setState(() {
      productList.removeAt(index);
    });
  }

  // Fungsi untuk menampilkan detail
  void _showDetails(String product) {
    // Implementasi tampilan atau aksi detail di sini
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detail dari $product'),
          content: Text('Ini adalah informasi detail tentang $product.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}