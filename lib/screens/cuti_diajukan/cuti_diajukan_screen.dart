import 'package:flutter/material.dart';
import 'package:project_manajemen_cuti/providers/kuota_cuti_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/cuti_provider.dart';

class CutiDiajukanScreen extends StatelessWidget {
  const CutiDiajukanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cutiDiajukanProvider = Provider.of<CutiDiajukanProvider>(context);
    final data = cutiDiajukanProvider.data;

    final kuotaCutiProvider = Provider.of<KuotaCutiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuti Diajukan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: data.map((item) {
            final tanggalstring = item.tanggal.split(" ");
            return Column(
              children: [
                ListTile(
                  title: Text(tanggalstring[0]),
                  subtitle: Text(item.alasanCuti),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      kuotaCutiProvider.decrementCutiTerpakai();
                      cutiDiajukanProvider.deleteData(item.id);
                    },
                  ),
                ),
                const Divider(),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
