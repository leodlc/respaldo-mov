class ClimaModelo {
  final String ciudad;
  final double temperatura;
  final String descripcion;

  ClimaModelo({
    required this.ciudad,
    required this.temperatura,
    required this.descripcion,
  });

  // Convertir JSON a objeto
  factory ClimaModelo.fromJson(Map<String, dynamic> json) {
    return ClimaModelo(
      ciudad: json['name'], // Accede al nombre de la ciudad
      temperatura: json['main']['temp'], // Accede a la temperatura en 'main'
      descripcion: json['weather'][0]
          ['description'], // Accede a la descripción en 'weather[0]'
    );
  }
}
