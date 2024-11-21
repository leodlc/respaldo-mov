class Banquete {
  double calcularCostoPorPersona(int numeroDePersonas) {
    if (numeroDePersonas > 300) {
      return 75.0;
    } else if (numeroDePersonas > 200) {
      return 85.0;
    } else {
      return 95.0;
    }
  }

  double calcularPresupuesto(int numeroDePersonas) {
    double costoPorPersona = calcularCostoPorPersona(numeroDePersonas);
    return costoPorPersona * numeroDePersonas;
  }
}
