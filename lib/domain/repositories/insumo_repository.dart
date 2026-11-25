import '../entities/insumo.dart';

abstract class InsumoRepository {
  Stream<List<Insumo>> observarInsumos();
  Future<void> guardarInsumo(Insumo insumo);
  Future<void> eliminarInsumo(String id);
}
