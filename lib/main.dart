import 'package:flutter/material.dart';
import 'package:project_manajemen_cuti/providers/cuti_provider.dart';
import 'package:project_manajemen_cuti/providers/kuota_cuti_provider.dart';
import 'package:project_manajemen_cuti/providers/profil_provider.dart';
import 'package:project_manajemen_cuti/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CutiDiajukanProvider()),
        ChangeNotifierProvider(create: (context) => ProfilProvider()),
        ChangeNotifierProvider(create: (context) => KuotaCutiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Manajemen Cuti',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
