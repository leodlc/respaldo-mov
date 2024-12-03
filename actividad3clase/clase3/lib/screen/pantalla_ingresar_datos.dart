import 'package:flutter/material.dart';
import '../screen/pantalla_calcular_edad.dart';

class IngresarDatosPage extends StatelessWidget {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _anioController = TextEditingController();
  final TextEditingController _mesController = TextEditingController();
  final TextEditingController _diaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresar Datos'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20.0),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _anioController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Año',
                      icon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                SizedBox(width: 20.0), // Cambié el `height` por `width` para dar espacio horizontal
                Expanded(
                  child: TextFormField(
                    controller: _mesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Mes',
                      icon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                SizedBox(width: 20.0), // Espacio horizontal
                Expanded(
                  child: TextFormField(
                    controller: _diaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Día',
                      icon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String nombre = _nombreController.text.trim();
                int anio = int.tryParse(_anioController.text.trim()) ?? 0;
                int mes = int.tryParse(_mesController.text.trim()) ?? 0;
                int dia = int.tryParse(_diaController.text.trim()) ?? 0;

                // Verificar si los valores de fecha son válidos
                if (anio > 0 && mes > 0 && dia > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalcularEdadPage(
                        nombre: nombre,
                        anioNacimiento: anio,
                        mesNacimiento: mes,
                        diaNacimiento: dia,
                      ),
                    ),
                  );
                } else {
                  // Agregar lógica de manejo de errores si la fecha no es válida
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor, ingrese una fecha válida')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Calcular Edad'),
            ),
          ],
        ),
      ),
    );
  }
}
