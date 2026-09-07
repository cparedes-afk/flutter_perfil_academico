import 'package:flutter/material.dart';
import '../data/cursos_data.dart';
import '../widgets/curso_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado sin iconos redundantes
              const Text(
                'Catálogo de Cursos',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Lista de cursos disponible
              Expanded(
                child: ListView.builder(
                  itemCount: cursosDisponibles.length,
                  itemBuilder: (context, index) {
                    final curso = cursosDisponibles[index];
                    return CursoCard(curso: curso);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
