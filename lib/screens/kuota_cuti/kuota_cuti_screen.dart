import 'package:flutter/material.dart';
import 'package:project_manajemen_cuti/common_widgets/cuti_card.dart';
import 'package:provider/provider.dart';

import '../../providers/kuota_cuti_provider.dart';

class KuotaCutiScreen extends StatelessWidget {
  const KuotaCutiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    final kuotaCutiProvider = Provider.of<KuotaCutiProvider>(context);
    final data = kuotaCutiProvider.data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuota Cuti'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: maxWidth,
        height: maxHeight,
        child: Column(
          children: [
            CutiCard(
              title: 'Kuota Cuti Tahunan',
              value: data.kuotaCutiTahunan,
            ),
            CutiCard(
              title: 'Cuti Terpakai',
              value: data.cutiTerpakai,
            ),
            CutiCard(
              title: 'Sisa Cuti',
              value: data.kuotaCutiTahunan - data.cutiTerpakai,
            ),
          ],
        ),
      ),
    );
  }
}
