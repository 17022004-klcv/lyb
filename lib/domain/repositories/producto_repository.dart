import '../entities/producto.dart';

abstract class ProductoRepository {
  Stream<List<Producto>> observarProductos();
  Future<void> guardarProducto(Producto producto);
  Future<void> eliminarProducto(String id);
}
