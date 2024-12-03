import 'package:flutter/material.dart';
import '../screen/pantalla_calcular_edad.dart';
import '../screen/pantalla_ingresar_datos.dart';
class PantallaBienvenida extends StatelessWidget {
  final String usuario;
  //PantallaBienvenida(this.usuario)
  PantallaBienvenida({super.key, required this.usuario});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        backgroundColor: Colors.blueGrey,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hola, $usuario',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

            ),
            SizedBox(height: 20.0),
            Text('Bienvenido a la aplicación de Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
             style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
             ),
             child: Text('Cerrar Sesión',)
            ),
            // boton para ir a la pantalla de ingresar Datos
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => IngresarDatosPage()));
            },
             style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
             ),
             child: Text('Ingresar Datos',)
            ),
            
          ],
        ),
      ),
    );
  }
}