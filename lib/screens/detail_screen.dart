import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/curso.dart';
import '../providers/curso_provider.dart';
import '../widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  final Curso curso;

  const DetailScreen({super.key, required this.curso});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(curso.nombre)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                curso.imagen,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.book, size: 50, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              curso.nombre,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Créditos: ${curso.creditos} | Costo: \$${curso.precio}',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(curso.descripcion, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Consumer<CursoProvider>(
              builder: (context, provider, child) {
                final inscrito = provider.esInscrito(curso);
                return CustomButton(
                  texto: inscrito ? 'Quitar de Mis Cursos' : 'Inscribir Curso',
                  icon: inscrito ? Icons.remove_circle : Icons.add_circle,
                  color: inscrito ? Colors.red : Colors.indigo,
                  onPressed: () {
                    provider.toggleInscripcion(curso);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
