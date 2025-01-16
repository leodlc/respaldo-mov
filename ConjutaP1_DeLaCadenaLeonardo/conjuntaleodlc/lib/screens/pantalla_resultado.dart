import 'package:flutter/material.dart';

class PantallaResultado extends StatelessWidget {
  final String nombre;
  final String sexo;
  final String grupo;

  const PantallaResultado({
    Key? key,
    required this.nombre,
    required this.sexo,
    required this.grupo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Elegir el color según el sexo
    final colorSexo = sexo == 'Mujer'
        ? Color(0xFFFFC0CB)
        : Color(0xFF87CEEB); // Rosado para mujer, azul para hombre
    final iconoGrupo = grupo == 'A'
        ? Icons.star // Ícono para el grupo A
        : Icons.group; // Ícono para el grupo B

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
        backgroundColor: colorSexo, // Cambiar color del AppBar según el sexo
      ),
      backgroundColor: Color(0xFFF2FDFD), // Fondo claro
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconoGrupo,
              size: 100,
              color: colorSexo, // Ícono con el color según el sexo
            ),
            SizedBox(height: 20),
            Text(
              'Hola, $nombre ($sexo)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorSexo, // Texto destacado con color según el sexo
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tu grupo es: $grupo',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: grupo == 'A'
                    ? Color(0xFF5DEBD7)
                    : Color(0xFF38C9BB), // Color del grupo
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorSexo, // Botón con el color según el sexo
                foregroundColor: Colors.white, // Texto blanco
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Volver', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
