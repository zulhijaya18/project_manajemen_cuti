import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final namaPenggunaController = TextEditingController();
  final instansiController = TextEditingController();
  final emailController = TextEditingController();
  final teleponController = TextEditingController();

  _ambilDataDariStorage() async {
    // call instance
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    namaPenggunaController.text = prefs.getString('namaPengguna') ?? '';
    instansiController.text = prefs.getString('instansi') ?? '';
    emailController.text = prefs.getString('email') ?? '';
    teleponController.text = prefs.getString('telepon') ?? '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _ambilDataDariStorage();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            TextField(
              controller: namaPenggunaController,
              decoration: const InputDecoration(
                label: Text('Nama Pengguna'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: instansiController,
              decoration: const InputDecoration(
                label: Text('Nama Instansi/Perusahaan'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: teleponController,
              decoration: const InputDecoration(
                label: Text('Nomor Telepon'),
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: maxWidth * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final namaPengguna = namaPenggunaController.text;
                  final instansi = instansiController.text;
                  final email = emailController.text;
                  final telepon = teleponController.text;

                  // call instance
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  // store data
                  await prefs.setString("namaPengguna", namaPengguna);
                  await prefs.setString("instansi", instansi);
                  await prefs.setString("email", email);
                  await prefs.setString("telepon", telepon);
                },
                child: const Text('Simpan'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
