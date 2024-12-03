import 'package:flutter/material.dart';
import '../logic/logica_grupo.dart';
import 'pantalla_resultado.dart';

class PantallaInicio extends StatefulWidget {
  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final TextEditingController _controladorNombre = TextEditingController();
  String _sexo = 'Mujer';

  void _mostrarResultado() {
    final nombre = _controladorNombre.text.trim();
    if (nombre.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor ingresa un nombre')),
      );
      return;
    }

    final grupo = LogicaGrupo().determinarGrupo(nombre, _sexo);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PantallaResultado(nombre: nombre, sexo: _sexo, grupo: grupo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clasificación de Grupos'),
        backgroundColor: Color(0xFF5DEBD7), // Color principal para el AppBar
      ),
      backgroundColor: Color(0xFFF2FDFD), // Color de fondo claro
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://cdn-icons-png.freepik.com/512/166/166258.png",
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _controladorNombre,
              decoration: InputDecoration(
                labelText: 'Nombre',
                labelStyle:
                    TextStyle(color: Color(0xFF5DEBD7)), // Color principal
                filled: true,
                fillColor: Color(0xFFE0F8F5), // Fondo más claro
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF5DEBD7)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF5DEBD7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF38C9BB)),
                ),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _sexo,
              items: [
                DropdownMenuItem(
                  value: 'Mujer',
                  child: Text('Mujer'),
                ),
                DropdownMenuItem(
                  value: 'Hombre',
                  child: Text('Hombre'),
                ),
              ],
              onChanged: (nuevoSexo) {
                setState(() {
                  _sexo = nuevoSexo!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Sexo',
                labelStyle: TextStyle(color: Color(0xFF5DEBD7)),
                filled: true,
                fillColor: Color(0xFFE0F8F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF5DEBD7)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF5DEBD7)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFF38C9BB)),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _mostrarResultado,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5DEBD7), // Color principal
                foregroundColor: Colors.white, // Texto en blanco
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Mostrar Grupo'),
            ),
          ],
        ),
      ),
    );
  }
}
