import 'package:flutter/material.dart';
import 'package:flutter_google_maps_exemplo/pages/login_page.dart';
import 'package:flutter_google_maps_exemplo/pages/payavisit_page.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'contract_linking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContractLinking>(
        create: (_) => ContractLinking(),
        child: GetMaterialApp(
          title: 'PayAVisit',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          //themeMode: ThemeMode.dark,
          home: LoginPage(),
        )
    );
  }
}
