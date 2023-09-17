import 'dart:developer';
import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:project_manajemen_cuti/models/cuti_model.dart';
import 'package:project_manajemen_cuti/providers/cuti_provider.dart';
import 'package:project_manajemen_cuti/providers/kuota_cuti_provider.dart';
import 'package:project_manajemen_cuti/screens/cuti_diajukan/cuti_diajukan_screen.dart';
import 'package:provider/provider.dart';

class AjukanCutiScreen extends StatefulWidget {
  const AjukanCutiScreen({super.key});

  @override
  State<AjukanCutiScreen> createState() => _AjukanCutiScreenState();
}

class _AjukanCutiScreenState extends State<AjukanCutiScreen> {
  final alasanCutiController = TextEditingController();
  List<DateTime> dates = [];
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    final cutiDiajukanProvider = Provider.of<CutiDiajukanProvider>(context);
    final kuotaCutiProvider = Provider.of<KuotaCutiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajukan Cuti'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              TextField(
                controller: alasanCutiController,
                decoration: const InputDecoration(
                  label: Text('Alasan Cuti'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(),
                value: dates,
                onValueChanged: (value) =>
                    selectedDate = value[0] ?? DateTime.now(),
              ),
              SizedBox(
                width: maxWidth * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    // inisial data
                    final alasanCuti = alasanCutiController.text;
                    final tanggal = selectedDate.toLocal().toString();

                    // generate id
                    final id = Random().nextInt(999);

                    // simpan data di state manajemen
                    cutiDiajukanProvider.addData(
                      CutiModel(
                        id: id,
                        alasanCuti: alasanCuti,
                        tanggal: tanggal,
                      ),
                    );

                    // tambah kuota cuti
                    kuotaCutiProvider.incrementCutiTerpakai();

                    // pindah halaman
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CutiDiajukanScreen(),
                      ),
                    );
                  },
                  child: const Text('Ajukan'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
