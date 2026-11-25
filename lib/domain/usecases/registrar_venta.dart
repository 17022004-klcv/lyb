import '../entities/insumo.dart';
import '../entities/producto.dart';
import '../entities/venta.dart';
import '../repositories/venta_repository.dart';
import 'calcular_finanzas_producto.dart';

class RegistrarVenta {
  final VentaRepository _ventaRepository;
  final CalcularFinanzasProducto _calcularFinanzas;

  RegistrarVenta(this._ventaRepository, this._calcularFinanzas);

  Future<Venta> call({
    required String idVenta,
    required Producto producto,
    required Map<String, Insumo> insumosPorId,
    required int cantidad,
    double? precioUnitarioOverride,
    DateTime? fecha,
  }) async {
    final resumen = _calcularFinanzas(
      producto: producto,
      insumosPorId: insumosPorId,
      precioVentaOverride: precioUnitarioOverride,
    );

    final precioCobrado = precioUnitarioOverride ?? producto.precioVenta;
    final ingresoTotal = precioCobrado * cantidad;
    final costoTotalCongelado = resumen.costoUnitarioTotal * cantidad;
    final gananciaTotal = ingresoTotal - costoTotalCongelado;
    final margenReal = ingresoTotal > 0
        ? (gananciaTotal / ingresoTotal) * 100
        : 0.0;

    final venta = Venta(
      id: idVenta,
      productoId: producto.id,
      nombreProducto: producto.nombre,
      cantidad: cantidad,
      precioUnitarioCobrado: precioCobrado,
      costoUnitarioCongelado: resumen.costoUnitarioTotal,
      gananciaTotal: gananciaTotal,
      margenPorcentaje: margenReal,
      fecha: fecha ?? DateTime.now(),
    );

    await _ventaRepository.registrarVenta(venta);
    return venta;
  }
}
