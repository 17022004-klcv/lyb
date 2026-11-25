import '../entities/movimiento_capital.dart';
import '../entities/venta.dart';

class BalanceFinanciero {
  final double inversionTotal;
  final double gastosOperativos;
  final double ingresosVentas;
  final double gananciaAcumulada;
  final double balanceRecuperacion; // positivo = ya recuperó inversión

  const BalanceFinanciero({
    required this.inversionTotal,
    required this.gastosOperativos,
    required this.ingresosVentas,
    required this.gananciaAcumulada,
    required this.balanceRecuperacion,
  });
}

class CalcularBalanceInversion {
  BalanceFinanciero call({
    required List<MovimientoCapital> movimientos,
    required List<Venta> ventas,
  }) {
    double inversionTotal = 0.0;
    double gastosOperativos = 0.0;

    for (final mov in movimientos) {
      if (mov.tipo == 'inversion') {
        inversionTotal += mov.monto;
      } else if (mov.tipo == 'compra_insumo' || mov.tipo == 'gasto_operativo') {
        gastosOperativos += mov.monto;
      }
    }

    double ingresosVentas = 0.0;
    double gananciaAcumulada = 0.0;

    for (final venta in ventas) {
      ingresosVentas += venta.precioUnitarioCobrado * venta.cantidad;
      gananciaAcumulada += venta.gananciaTotal;
    }

    final balanceRecuperacion = gananciaAcumulada - inversionTotal;

    return BalanceFinanciero(
      inversionTotal: inversionTotal,
      gastosOperativos: gastosOperativos,
      ingresosVentas: ingresosVentas,
      gananciaAcumulada: gananciaAcumulada,
      balanceRecuperacion: balanceRecuperacion,
    );
  }
}
