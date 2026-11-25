class ItemReceta {
  final String insumoId;
  final double cantidad;

  const ItemReceta({required this.insumoId, required this.cantidad});

  ItemReceta copyWith({String? insumoId, double? cantidad}) {
    return ItemReceta(
      insumoId: insumoId ?? this.insumoId,
      cantidad: cantidad ?? this.cantidad,
    );
  }
}
