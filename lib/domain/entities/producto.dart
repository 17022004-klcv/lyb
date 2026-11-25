import 'item_receta.dart';

class Producto {
  final String id;
  final String nombre;
  final String categoria; // ej. 'vela', 'jabon'
  final String? imagenUrl;
  final double precioVenta;
  final double costosExtra; // empaque, etiqueta, luz/gas extra por unidad
  final List<ItemReceta> receta;
  final double? margenReferencia; // opcional: solo guía visual editable

  const Producto({
    required this.id,
    required this.nombre,
    required this.categoria,
    this.imagenUrl,
    required this.precioVenta,
    this.costosExtra = 0.0,
    this.receta = const [],
    this.margenReferencia,
  });

  Producto copyWith({
    String? id,
    String? nombre,
    String? categoria,
    String? imagenUrl,
    double? precioVenta,
    double? costosExtra,
    List<ItemReceta>? receta,
    double? margenReferencia,
  }) {
    return Producto(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      categoria: categoria ?? this.categoria,
      imagenUrl: imagenUrl ?? this.imagenUrl,
      precioVenta: precioVenta ?? this.precioVenta,
      costosExtra: costosExtra ?? this.costosExtra,
      receta: receta ?? this.receta,
      margenReferencia: margenReferencia ?? this.margenReferencia,
    );
  }
}
