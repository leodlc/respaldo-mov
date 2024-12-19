import 'package:flutter/material.dart';
import 'views/coches_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false, // Oculta el banner de depuración
      theme: ThemeData(
        primarySwatch: Colors.cyan, // Configura el color principal
        colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.cyanAccent), // Personaliza el esquema de color
      ),
      home: VistaCoches(),
    );
  }
}
