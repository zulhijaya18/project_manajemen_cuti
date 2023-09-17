import 'package:flutter/material.dart';
import 'package:project_manajemen_cuti/common_widgets/cuti_card.dart';

class KuotaCutiScreen extends StatelessWidget {
  const KuotaCutiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuota Cuti'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: maxWidth,
        height: maxHeight,
        child: const Column(
          children: [
            CutiCard(
              title: 'Kuota Cuti Tahunan',
              value: 7,
            ),
            CutiCard(
              title: 'Cuti Terpakai',
              value: 4,
            ),
            CutiCard(
              title: 'Sisa Cuti',
              value: 3,
            ),
          ],
        ),
      ),
    );
  }
}
