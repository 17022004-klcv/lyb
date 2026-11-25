import '../entities/movimiento_capital.dart';

abstract class CapitalRepository {
  Stream<List<MovimientoCapital>> observarMovimientos();
  Future<void> registrarMovimiento(MovimientoCapital movimiento);
}
