import '../entities/insumo.dart';
import '../entities/producto.dart';

class ResumenFinancieroProducto {
  final double costoMateriales;
  final double costoUnitarioTotal;
  final double gananciaUnitaria;
  final double margenPorcentaje; // dinámico según precioVenta y costo actuales

  const ResumenFinancieroProducto({
    required this.costoMateriales,
    required this.costoUnitarioTotal,
    required this.gananciaUnitaria,
    required this.margenPorcentaje,
  });
}

class CalcularFinanzasProducto {
  ResumenFinancieroProducto call({
    required Producto producto,
    required Map<String, Insumo> insumosPorId,
    double? precioVentaOverride,
  }) {
    double costoMateriales = 0.0;

    for (final item in producto.receta) {
      final insumo = insumosPorId[item.insumoId];
      if (insumo != null) {
        costoMateriales += item.cantidad * insumo.precioUnitario;
      }
    }

    final costoUnitarioTotal = costoMateriales + producto.costosExtra;
    final precioEfectivo = precioVentaOverride ?? producto.precioVenta;
    final gananciaUnitaria = precioEfectivo - costoUnitarioTotal;

    final margenPorcentaje = precioEfectivo > 0
        ? (gananciaUnitaria / precioEfectivo) * 100
        : 0.0;

    return ResumenFinancieroProducto(
      costoMateriales: costoMateriales,
      costoUnitarioTotal: costoUnitarioTotal,
      gananciaUnitaria: gananciaUnitaria,
      margenPorcentaje: margenPorcentaje,
    );
  }
}
