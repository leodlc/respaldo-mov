import 'package:flutter/material.dart';
import '../logic/calcular_edad.dart';

class CalcularEdadPage extends StatefulWidget {
  final String nombre;
  final int anioNacimiento;
  final int mesNacimiento;
  final int diaNacimiento;

  const CalcularEdadPage({
    super.key,
    required this.nombre,
    required this.anioNacimiento,
    required this.mesNacimiento,
    required this.diaNacimiento,
  });

  @override
  _CalcularEdadPageState createState() => _CalcularEdadPageState();
}

class _CalcularEdadPageState extends State<CalcularEdadPage> {
  late Edad edad;

  @override
  void initState() {
    super.initState();
    // Calcular la edad usando la clase `Edad`
    edad = calcularEdad(widget.anioNacimiento, widget.mesNacimiento, widget.diaNacimiento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular Edad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nombre: ${widget.nombre}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Edad:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${edad.anios} años, ${edad.mes} meses, ${edad.dia} días',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}