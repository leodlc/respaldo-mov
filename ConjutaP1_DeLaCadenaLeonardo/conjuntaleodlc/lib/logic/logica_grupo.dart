class LogicaGrupo {
  String determinarGrupo(String nombre, String sexo) {
    final primeraLetra = nombre[0].toUpperCase();
    if (sexo == 'Mujer' && primeraLetra.compareTo('M') < 0) {
      return 'A';
    } else if (sexo == 'Hombre' && primeraLetra.compareTo('N') > 0) {
      return 'A';
    } else {
      return 'B';
    }
  }
}
