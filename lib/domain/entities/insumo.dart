class Insumo {
  final String id;
  final String nombre;
  final String unidad; // ej. 'oz', 'g', 'ml', 'unidad'
  final double precioUnitario;
  final DateTime actualizadoEn;

  const Insumo({
    required this.id,
    required this.nombre,
    required this.unidad,
    required this.precioUnitario,
    required this.actualizadoEn,
  });

  Insumo copyWith({
    String? id,
    String? nombre,
    String? unidad,
    double? precioUnitario,
    DateTime? actualizadoEn,
  }) {
    return Insumo(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      unidad: unidad ?? this.unidad,
      precioUnitario: precioUnitario ?? this.precioUnitario,
      actualizadoEn: actualizadoEn ?? this.actualizadoEn,
    );
  }
}
