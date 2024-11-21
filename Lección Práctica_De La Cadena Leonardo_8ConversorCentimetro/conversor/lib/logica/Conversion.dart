class Conversion {
  Map<String, double> convertirCentimetros(double centimetros) {
    const double cmPorMetro = 100.0;
    const double cmPorPulgada = 2.54;
    const double cmPorPie = 30.48;
    const double cmPorYarda = 91.44027578;

    return {
      "metros": centimetros / cmPorMetro,
      "pulgadas": centimetros / cmPorPulgada,
      "pies": centimetros / cmPorPie,
      "yardas": centimetros / cmPorYarda,
    };
  }
}
