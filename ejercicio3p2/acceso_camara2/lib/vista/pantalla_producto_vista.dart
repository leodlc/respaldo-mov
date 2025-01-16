import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Detectar plataforma Web
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../controlador/producto_controlador.dart';
import '../modelo/producto_modelo.dart';
import 'detalle_producto_vista.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final ProductoControlador _controlador = ProductoControlador();
  final ImagePicker _selectorDeImagenes = ImagePicker();

  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  Future<void> _cargarProductos() async {
    await _controlador.cargarProductosEnAlmacenamiento();
    setState(() {});
  }

  Future<void> agregarProducto() async {
    final archivoSeleccionado = await _selectorDeImagenes.pickImage(
      source: ImageSource.camera,
    );

    if (archivoSeleccionado != null) {
      final controladorNombre = TextEditingController();
      final controladorDetalle = TextEditingController();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Agregar Producto"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controladorNombre,
                  decoration: InputDecoration(labelText: "Nombre del producto"),
                ),
                TextField(
                  controller: controladorDetalle,
                  decoration:
                      InputDecoration(labelText: "Detalle del producto"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  final nuevoProducto = Producto(
                    rutaImagen: kIsWeb
                        ? 'https://via.placeholder.com/150'
                        : archivoSeleccionado.path,
                    nombre: controladorNombre.text,
                    detalle: controladorDetalle.text,
                  );

                  _controlador.agregarProducto(nuevoProducto);
                  setState(() {});
                  Navigator.of(context).pop();
                },
                child: Text("Guardar"),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _mostrarImagen(Producto producto) {
    if (kIsWeb) {
      return producto.rutaImagen.isNotEmpty
          ? Image.network(
              producto.rutaImagen,
              height: 70,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: 70,
                color: Colors.grey,
              ),
            )
          : Icon(Icons.image, size: 70, color: Colors.grey);
    } else {
      return producto.rutaImagen.isNotEmpty
          ? Image.file(
              File(producto.rutaImagen),
              height: 70,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.broken_image,
                size: 70,
                color: Colors.grey,
              ),
            )
          : Icon(Icons.image, size: 70, color: Colors.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productos = _controlador.obtenerProductos();

    return Scaffold(
      backgroundColor: Color(0xFF0B192C),
      appBar: AppBar(
        title: Text(
          "LISTADO DE PRODUCTOS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0B192C),
        elevation: 0,
      ),
      body: productos.isEmpty
          ? Center(
              child: Text(
                "No hay productos guardados.",
                style: TextStyle(color: Colors.white),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: productos.length,
                itemBuilder: (context, indice) {
                  final producto = productos[indice];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetalleProductoVista(producto: producto),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent, // Fondo transparente
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 8,
                            offset: Offset(0, 4), // Sombra hacia abajo
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          _mostrarImagen(producto),
                          SizedBox(height: 10),
                          Text(
                            producto.nombre.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon:
                                    Icon(Icons.edit, color: Color(0xFFFF6500)),
                                onPressed: () {
                                  // Lógica para editar
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete,
                                    color: Color(0xFFFF6500)),
                                onPressed: () {
                                  setState(() {
                                    _controlador.eliminarProducto(producto);
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarProducto,
        child: Icon(Icons.camera_alt),
        backgroundColor: Color(0xFFFF6500),
      ),
    );
  }
}
