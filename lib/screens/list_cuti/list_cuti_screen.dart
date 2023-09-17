import 'package:flutter/material.dart';

class ListCutiScreen extends StatelessWidget {
  const ListCutiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Cuti'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text('2023-04-7'),
              subtitle: Text('Wafat Isa Al Masih'),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
