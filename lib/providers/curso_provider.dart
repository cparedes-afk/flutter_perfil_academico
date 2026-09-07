import 'package:flutter/material.dart';

class CursoProvider extends ChangeNotifier {
  final List<dynamic> _cursosGuardados = [];

  List<dynamic> get cursosGuardados => _cursosGuardados;

  // Método para verificar si un curso está guardado / inscrito
  bool esGuardado(dynamic curso) {
    return _cursosGuardados.contains(curso);
  }

  // Método para agregar o quitar un curso
  void toggleGuardar(dynamic curso) {
    if (_cursosGuardados.contains(curso)) {
      _cursosGuardados.remove(curso);
    } else {
      _cursosGuardados.add(curso);
    }
    notifyListeners(); // Notifica a todas las pantallas para actualizar la interfaz
  }

  // ALIAS NOMBRES COMPATIBLES CON DETAIL_SCREEN.DART
  bool esInscrito(dynamic curso) => esGuardado(curso);

  void toggleInscripcion(dynamic curso) => toggleGuardar(curso);

  // Cálculo del total de créditos para la pantalla de Resumen
  int get totalCreditos {
    int total = 0;
    for (var curso in _cursosGuardados) {
      try {
        total += ((curso.creditos ?? curso.credits ?? 0) as num).toInt();
      } catch (_) {}
    }
    return total;
  }

  // Cálculo del precio total para la pantalla de Resumen
  double get totalCosto {
    double total = 0.0;
    for (var curso in _cursosGuardados) {
      try {
        total += ((curso.costo ?? curso.precio ?? curso.price ?? 0) as num)
            .toDouble();
      } catch (_) {}
    }
    return total;
  }
}
