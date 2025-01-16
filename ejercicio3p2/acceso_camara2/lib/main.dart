import 'package:flutter/material.dart';
import 'vista/pantalla_producto_vista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestión de Productos',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: PantallaPrincipal(),
    );
  }
}
