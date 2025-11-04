class UniversidadesFb {
  final String nit;
  final String nombre;
  final String direccion;
  final String telefono;
  final String pagina_web;

  UniversidadesFb({
    required this.nit,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.pagina_web,
  });

  factory UniversidadesFb.fromMap(String nit, Map<String, dynamic> data) {
    return UniversidadesFb(
      nit: nit,
      nombre: data['nombre'] ?? '',
      direccion: data['direccion'] ?? '',
      telefono: data['telefono'] ?? '',
      pagina_web: data['pagina_web'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
      'pagina_web': pagina_web,
    };
  }
}
