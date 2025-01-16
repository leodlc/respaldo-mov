import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../modelo/producto_modelo.dart';

class ProductoControlador {
  final List<Producto> _productos = [];

  // Método para agregar un producto
  void agregarProducto(Producto producto) {
    _productos.add(producto);
    _guardarProductosEnAlmacenamiento();
  }

  // listar / ver todos los elemtnos
  List<Producto> obtenerProductos() {
    return _productos;
  }

  // meotodo para eliminar
  void eliminarProducto(Producto producto) {
    _productos.remove(producto);
    _guardarProductosEnAlmacenamiento();
  }

  // Método para guardar los productos en el almacenamiento
  Future<void> _guardarProductosEnAlmacenamiento() async {
    final prefs = await SharedPreferences.getInstance();

    // Convertir la lista de productos a una lista de mapas y luego a JSON
    final productosJson = _productos
        .map((producto) => {
              'rutaImagen': producto.rutaImagen,
              'nombre': producto.nombre,
              'detalle': producto.detalle,
            })
        .toList();

    await prefs.setString('productos', jsonEncode(productosJson));
  }

  // Método para cargar los productos desde el almacenamiento
  Future<void> cargarProductosEnAlmacenamiento() async {
    final prefs = await SharedPreferences.getInstance();

    // Obtener el JSON almacenado como cadena
    final productosJson = prefs.getString('productos');

    // Verificar si el valor es nulo antes de procesarlo
    if (productosJson != null) {
      // Decodificar la cadena JSON a una lista dinámica
      final List<dynamic> productosMap = jsonDecode(productosJson);

      // Limpiar la lista actual y agregar los productos decodificados
      _productos.clear();
      _productos.addAll(productosMap.map((producto) => Producto(
            rutaImagen: producto['rutaImagen'],
            nombre: producto['nombre'],
            detalle: producto['detalle'],
          )));
    }
  }
}
