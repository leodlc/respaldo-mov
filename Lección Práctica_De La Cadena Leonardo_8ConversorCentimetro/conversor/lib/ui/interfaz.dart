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
      backgroundColor: Color(0xFF191919), // Fondo negro
      appBar: AppBar(
        title: Text(
          "8:Conversión de Longitudes - Leonardo De La Cadena",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF191919), // Fondo negro en AppBar
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen en la parte superior
            Image.asset(
              'assets/img/icono.png',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            // Campo de entrada
            TextField(
              controller: _cmController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white), // Texto ingresado blanco
              decoration: InputDecoration(
                labelText: "Valor en Centímetros",
                labelStyle: TextStyle(color: Colors.white), // Texto del label blanco
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borde blanco
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF41B06E)), // Borde verde al enfocar
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Botón
            ElevatedButton(
              onPressed: _convertir,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF41B06E), // Botón verde
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "Convertir",
                style: TextStyle(color: Colors.white), // Texto blanco
              ),
            ),
            SizedBox(height: 20),
            // Resultados
            Text(
              _resultado,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Texto blanco
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
