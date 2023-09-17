import 'package:flutter/material.dart';
import 'package:project_manajemen_cuti/screens/ajukan_cuti/ajukan_cuti_screen.dart';
import 'package:project_manajemen_cuti/screens/cuti_diajukan/cuti_diajukan_screen.dart';
import 'package:project_manajemen_cuti/screens/kuota_cuti/kuota_cuti_screen.dart';
import 'package:project_manajemen_cuti/screens/list_cuti/list_cuti_screen.dart';
import 'package:project_manajemen_cuti/screens/profil/profil_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/profil_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String namaPengguna = "";
  String namaInstansi = "";

  _ambilDataDariStorage() async {
    // call instance
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    namaPengguna = prefs.getString('namaPengguna') ?? '';
    namaInstansi = prefs.getString('instansi') ?? '';
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
    final maxHeight = MediaQuery.of(context).size.height;

    final profilProvider = Provider.of<ProfilProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Cuti'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilScreen(),
                ),
              );
            },
            icon: const Icon(Icons.person_outline),
          )
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const ListTile(
                title: Text('Home'),
              ),
              ListTile(
                title: const Text('List Cuti'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListCutiScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Ajukan Cuti'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AjukanCutiScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Kuota Cuti'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KuotaCutiScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Cuti Diajukan'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CutiDiajukanScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: maxWidth,
        height: maxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang ${profilProvider.data?.namapengguna ?? ''}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Di Aplikasi Manajemen Cuti',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              profilProvider.data?.instansi ?? '',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: maxWidth * 0.6,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AjukanCutiScreen(),
                    ),
                  );
                },
                child: const Text("Ajukan Cuti"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
