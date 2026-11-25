class Venta {
  final String id;
  final String productoId;
  final String nombreProducto;
  final int cantidad;
  final double precioUnitarioCobrado;
  final double costoUnitarioCongelado;
  final double gananciaTotal;
  final double margenPorcentaje;
  final DateTime fecha;

  const Venta({
    required this.id,
    required this.productoId,
    required this.nombreProducto,
    required this.cantidad,
    required this.precioUnitarioCobrado,
    required this.costoUnitarioCongelado,
    required this.gananciaTotal,
    required this.margenPorcentaje,
    required this.fecha,
  });
}
