import 'package:flutter/material.dart';
import './vista/clima_vista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App del Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClimaVista(),
    );
  }
}
