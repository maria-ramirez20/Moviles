import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/universidades.dart';


class UniversidadService {
  static final _ref = FirebaseFirestore.instance.collection('universidades');

  static Stream<UniversidadesFb?> watchUniversidadById(String id) {
    return _ref.doc(id).snapshots().map((doc) {
      if (doc.exists) {
        return UniversidadesFb.fromMap(doc.id, doc.data()!);
      }
      return null;
    });
  }

  /// Obtiene todas las universidades
  static Future<List<UniversidadesFb>> getUniversidades() async {
    final snapshot = await _ref.get();
    return snapshot.docs
        .map((doc) => UniversidadesFb.fromMap(doc.id, doc.data()))
        .toList();
  }

  /// Agrega una nueva universidad
  static Future<void> addUniversidad(UniversidadesFb universidad) async {
    await _ref.add(universidad.toMap());
  }

  /// Actualiza una universidad existente
  static Future<void> updateUniversidad(UniversidadesFb universidad) async {
    await _ref.doc(universidad.nit).update(universidad.toMap());
  }

  /// Obtiene una universidad por su ID
  static Future<UniversidadesFb?> getUniversidadById(String id) async {
    final doc = await _ref.doc(id).get();
    if (doc.exists) {
      return UniversidadesFb.fromMap(doc.id, doc.data()!);
    }
    return null;
  }

  /// Elimina una universidad
  static Future<void> deleteUniversidad(String id) async {
    await _ref.doc(id).delete();
  }

  //!/ Observa los cambios en la colección de universidades
  /// y devuelve una lista de universidades actualizada
  static Stream<List<UniversidadesFb>> watchUniversidades() {
    return _ref.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => UniversidadesFb.fromMap(doc.id, doc.data()))
          .toList();
    });
  }
}
