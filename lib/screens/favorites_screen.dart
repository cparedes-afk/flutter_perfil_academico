import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/curso_provider.dart';
import '../widgets/curso_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cursoProvider = Provider.of<CursoProvider>(context);
    final guardados = cursoProvider.cursosGuardados;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: guardados.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border,
                      size: 60, color: Colors.grey[400]),
                  const SizedBox(height: 12),
                  Text(
                    'No tienes cursos guardados.',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: guardados.length,
              itemBuilder: (context, index) {
                return CursoCard(curso: guardados[index]);
              },
            ),
    );
  }
}
