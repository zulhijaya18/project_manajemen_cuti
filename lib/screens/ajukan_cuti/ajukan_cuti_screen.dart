import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

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
                onValueChanged: (value) => setState(() {
                  selectedDate = value[0] ?? DateTime.now();
                }),
              ),
              SizedBox(
                width: maxWidth * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {},
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
