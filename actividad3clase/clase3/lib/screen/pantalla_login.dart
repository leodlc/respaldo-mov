import 'package:flutter/material.dart';
import '../logic/logica_login.dart';
import '../screen/pantalla_bienvenida.dart';

class PantallaLogin extends StatefulWidget {
  @override
  State<PantallaLogin> createState() => PantallaLoginState();
}

class PantallaLoginState extends State<PantallaLogin> {
  // declarar objetos visuales
  final TextEditingController controladorUsuario = TextEditingController();
  final TextEditingController controladorContrasena = TextEditingController();

  // instanciar la claseS
  final LogicaLogin logicaLogin = LogicaLogin();
  // mensaje
  String mensajeError = '';

  void iniciarSesion() {
    final usuario = controladorUsuario.text;
    final contrasena = controladorContrasena.text;

    if (logicaLogin.verificarCredenciales(usuario, contrasena)) {
      // Navigate push
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PantallaBienvenida(usuario: usuario)));
    } else {
      setState(() {
        mensajeError = 'Usuario o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF3594DD), Color(0xFF4563DB), Color(0xFF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 50, color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                      
                      //campo usuario
                      TextField(
                        controller: controladorUsuario,
                        decoration: InputDecoration(
                          hintText: 'Usuario',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.white.withOpacity(0.20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.green),
                      ),
                      // campo contraseña
                      TextField(
                        controller: controladorContrasena,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.white.withOpacity(0.20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(height: 20),

                      // mensaje de error
                      if (mensajeError.isNotEmpty)
                        Text(
                          mensajeError,
                          style: TextStyle(color: Colors.red),
                        ),
                      SizedBox(height: 20),
                      //boton
                      ElevatedButton(
                        onPressed: iniciarSesion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white54,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('Iniciar Sesión',),
                      )
                    ],
                  )

                )

              )
    ));
  }
}
