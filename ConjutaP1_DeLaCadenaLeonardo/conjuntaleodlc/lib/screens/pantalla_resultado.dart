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
    // Elegir el ícono y color según el grupo
    final iconoGrupo = grupo == 'A'
        ? Icons.star // Ícono para el grupo A
        : Icons.group; // Ícono para el grupo B
    final colorGrupo = grupo == 'A' ? Color(0xFF5DEBD7) : Color(0xFF38C9BB);

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
        backgroundColor: Color(0xFF5DEBD7), // Color principal
      ),
      backgroundColor: Color(0xFFF2FDFD), // Fondo claro
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconoGrupo,
              size: 100,
              color: colorGrupo, // Color asociado al grupo
            ),
            SizedBox(height: 20),
            Text(
              'Hola, $nombre ($sexo)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5DEBD7),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tu grupo es: $grupo',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: colorGrupo,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5DEBD7), // Color principal
                foregroundColor: Colors.white, // Texto blanco
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
