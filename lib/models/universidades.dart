class UniversidadesFb {
  final String id;          // ID del documento de Firestore
  final String nit;         // NIT de la universidad
  final String nombre;
  final String direccion;
  final String telefono;
  final String pagina_web;

  UniversidadesFb({
    required this.id,
    required this.nit,
    required this.nombre,
    required this.direccion,
    required this.telefono,
    required this.pagina_web,
  });

  factory UniversidadesFb.fromMap(String docId, Map<String, dynamic> data) {
    return UniversidadesFb(
      id: docId,                        // ID del documento
      nit: data['nit'] ?? '',          // NIT desde los datos
      nombre: data['nombre'] ?? '',
      direccion: data['direccion'] ?? '',
      telefono: data['telefono'] ?? '',
      pagina_web: data['pagina_web'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nit': nit,
      'nombre': nombre,
      'direccion': direccion,
      'telefono': telefono,
      'pagina_web': pagina_web,
    };
  }
}
