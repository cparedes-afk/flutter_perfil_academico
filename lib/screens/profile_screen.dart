import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/curso_provider.dart';
import '../widgets/curso_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cursoProvider = Provider.of<CursoProvider>(context);
    final cursos = cursoProvider.cursosGuardados;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Resumen de Matrícula (Totales)
          Card(
            color: Colors.indigo,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('Total Cursos',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text('${cursos.length}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(height: 35, width: 1, color: Colors.white30),
                  Column(
                    children: [
                      const Text('Total Créditos',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text('${cursoProvider.totalCreditos}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(height: 35, width: 1, color: Colors.white30),
                  Column(
                    children: [
                      const Text('Valor Total',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text('\$${cursoProvider.totalCosto.toStringAsFixed(1)}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'Cursos Seleccionados',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          if (cursos.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  children: [
                    Icon(Icons.school_outlined,
                        size: 60, color: Colors.grey[400]),
                    const SizedBox(height: 10),
                    Text(
                      'No has seleccionado ningún curso aún.',
                      style: TextStyle(color: Colors.grey[600], fontSize: 15),
                    ),
                  ],
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cursos.length,
              itemBuilder: (context, index) {
                return CursoCard(curso: cursos[index]);
              },
            ),
        ],
      ),
    );
  }
}
