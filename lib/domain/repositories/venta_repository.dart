import '../entities/venta.dart';

abstract class VentaRepository {
  Stream<List<Venta>> observarVentas();
  Future<void> registrarVenta(Venta venta);
}
