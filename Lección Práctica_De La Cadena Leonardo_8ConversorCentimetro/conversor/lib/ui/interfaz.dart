import 'package:flutter/material.dart';
import '../logica/Conversion.dart';

class InterfazConversion extends StatefulWidget {
  @override
  _InterfazConversionState createState() => _InterfazConversionState();
}

class _InterfazConversionState extends State<InterfazConversion> {
  final TextEditingController _cmController = TextEditingController();
  String _resultado = "";

  void _convertir() {
    double centimetros = double.tryParse(_cmController.text) ?? -1;
    if (centimetros < 0) {
      setState(() {
        _resultado = "Por favor, ingresa un valor válido en centímetros.";
      });
      return;
    }

    Conversion conversion = Conversion();
    Map<String, double> resultados = conversion.convertirCentimetros(centimetros);

    setState(() {
      _resultado = """
      Resultados para $centimetros cm:
      Metros: ${resultados["metros"]?.toStringAsFixed(2)} m
      Pulgadas: ${resultados["pulgadas"]?.toStringAsFixed(2)} in
      Pies: ${resultados["pies"]?.toStringAsFixed(2)} ft
      Yardas: ${resultados["yardas"]?.toStringAsFixed(2)} yd
      """;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversión de Longitudes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cmController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Valor en Centímetros",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertir,
              child: Text("Convertir"),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
