import 'package:flutter/material.dart';
import '../logica/banquete.dart';

class BanquetePage extends StatefulWidget {
  @override
  State<BanquetePage> createState() => BanquetePageState();
}

class BanquetePageState extends BanquetePage {
  final TextEditingController _numeroPersonasController =
      TextEditingController();

  // VARIABLE PARA MOSTRAR EL RESULTADO
  String _resultado = '';
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
