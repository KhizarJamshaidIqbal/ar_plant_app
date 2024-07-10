import 'package:ar_base_plant_app/firebase_options.dart';
import 'package:ar_base_plant_app/view/admin/dashboard_screen.dart';
import 'package:ar_base_plant_app/view/seller/home_page.dart';
import 'package:ar_base_plant_app/view/seller/profile_page.dart';
import 'package:ar_base_plant_app/view/seller/scan_page.dart';
import 'package:ar_base_plant_app/view/seller/set_values.dart';
import 'package:ar_base_plant_app/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Base Plant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home:  SetValuesForm(),
    );
  }
}