class MovimientoCapital {
  final String id;
  final String tipo; // 'inversion', 'compra_insumo', 'gasto_operativo'
  final String descripcion;
  final double monto;
  final DateTime fecha;

  const MovimientoCapital({
    required this.id,
    required this.tipo,
    required this.descripcion,
    required this.monto,
    required this.fecha,
  });
}
