import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart'; // Para detectar si es web
import '../modelo/producto_modelo.dart';

class DetalleProductoVista extends StatelessWidget {
  final Producto producto;

  DetalleProductoVista({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B192C), // Fondo principal
      appBar: AppBar(
        title: Text(
          producto.nombre.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF0B192C),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _mostrarImagen(producto),
            ),
            SizedBox(height: 20),
            Text(
              producto.detalle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _mostrarImagen(Producto producto) {
    if (kIsWeb) {
      // En la web, usa Image.network para mostrar imágenes desde una URL
      return producto.rutaImagen.isNotEmpty
          ? Image.network(
              producto.rutaImagen,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: 150,
                color: Colors.grey,
              ),
            )
          : Icon(Icons.image, size: 150, color: Colors.grey);
    } else {
      // En dispositivos móviles, usa Image.file para mostrar imágenes desde rutas locales
      return producto.rutaImagen.isNotEmpty
          ? Image.file(
              File(producto.rutaImagen),
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: 150,
                color: Colors.grey,
              ),
            )
          : Icon(Icons.image, size: 150, color: Colors.grey);
    }
  }
}
