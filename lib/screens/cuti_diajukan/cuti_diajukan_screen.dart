import 'package:flutter/material.dart';

class CutiDiajukanScreen extends StatelessWidget {
  const CutiDiajukanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuti Diajukan'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text('2023-01-01'),
              subtitle: Text('Acara Keluarga Tahun Baru'),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
