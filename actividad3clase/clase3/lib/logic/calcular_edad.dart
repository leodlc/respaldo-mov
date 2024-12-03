class Edad{
  final int anios;
  final int mes;
  final int dia;

  Edad({required this.anios, required this.mes, required this.dia});
 @override
  String toString() {
    return 'Edad: $anios anios, $mes meses, $dia días';
  }
}

Edad calcularEdad(int anioNacimiento, int mesNacimiento, int diaNacimiento) {
  DateTime fechaActual = DateTime.now();
  int anioActual = fechaActual.year;
  int mesActual = fechaActual.month;
  int diaActual = fechaActual.day;

  if (diaActual < diaNacimiento) {
    mesActual--;
    diaActual += 31;
  }
  if (mesActual < mesNacimiento) {
    anioActual--;
    mesActual += 12;
  }
  int edadAnios = anioActual - anioNacimiento;
  int edadMes = mesActual - mesNacimiento;
  int edadDias = diaActual - diaNacimiento;
  return Edad(anios: edadAnios, mes: edadMes, dia: edadDias);
}