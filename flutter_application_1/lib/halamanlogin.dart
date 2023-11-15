import 'package:flutter/material.dart';
import 'package:flutter_application_1/HalamanUtama.dart';

class DesainHalamanLogin extends StatefulWidget {
  const DesainHalamanLogin({Key? key}) : super(key: key);

  @override
  State<DesainHalamanLogin> createState() => _DesainHalamanLoginState();
}

class _DesainHalamanLoginState extends State<DesainHalamanLogin> {
  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            width: 350,
            height: 600,
            child: Card(
              elevation: 10,
              shadowColor: Color.fromARGB(255, 49, 54, 58),
              color: Color.fromARGB(255, 148, 140, 251),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image(
                           image: AssetImage('gambar/icon.jpg'),
                            width: 100, // Sesuaikan ukuran gambar
                            height: 100,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: cUser,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Input User Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'User Kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      controller: cPass,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Input Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String tUser = 'Admin';
                        String tPass = '12345';
                        if (formKey.currentState!.validate()) {
                          if (cUser.text == tUser && cPass.text == tPass) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DesainHalamanUtama(),
                              ),
                              (route) => false,
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Konfirmasi Login'),
                                  content: Text('User atau Password Masih Salah'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        cUser.text = '';
                                        cPass.text = '';
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Oke'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      child: Text('Masukan'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}