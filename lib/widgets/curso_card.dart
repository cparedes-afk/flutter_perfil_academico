import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/curso_provider.dart';

class CursoCard extends StatelessWidget {
  final dynamic curso;

  const CursoCard({super.key, required this.curso});

  @override
  Widget build(BuildContext context) {
    final cursoProvider = Provider.of<CursoProvider>(context);
    final bool esGuardado = cursoProvider.esGuardado(curso);

    // Obtención segura de propiedades
    final String titulo =
        _obtenerPropiedad(curso, ['titulo', 'title', 'nombre']) ?? 'Curso';
    final String imagen =
        _obtenerPropiedad(curso, ['imagen', 'image', 'urlImagen']) ?? '';
    final String descripcion =
        _obtenerPropiedad(curso, ['descripcion', 'description']) ??
            'Sin descripción disponible.';
    final num creditos = _obtenerNum(curso, ['creditos', 'credits']);
    final num precio = _obtenerNum(curso, ['costo', 'precio', 'price']);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (ctx) {
              return Consumer<CursoProvider>(
                builder: (context, provider, child) {
                  final bool guardadoModal = provider.esGuardado(curso);
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        if (imagen.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              imagen,
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const SizedBox.shrink(),
                            ),
                          ),
                        const SizedBox(height: 16),
                        Text(
                          titulo,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Chip(
                              label: Text('$creditos Créditos'),
                              backgroundColor: Colors.indigo.shade50,
                              labelStyle: const TextStyle(color: Colors.indigo),
                            ),
                            const SizedBox(width: 8),
                            Chip(
                              label: Text('\$${precio.toStringAsFixed(1)}'),
                              backgroundColor: Colors.green.shade50,
                              labelStyle: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text('Descripción:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(descripcion,
                            style: TextStyle(
                                color: Colors.grey[700], height: 1.4)),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              provider.toggleGuardar(curso);
                            },
                            icon: Icon(guardadoModal
                                ? Icons.remove_circle_outline
                                : Icons.add_circle_outline),
                            label: Text(
                              guardadoModal
                                  ? 'Quitar de Mis Cursos'
                                  : 'Añadir Curso',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: guardadoModal
                                  ? Colors.redAccent
                                  : Colors.indigo,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imagen,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 70,
                    height: 70,
                    color: Colors.grey[300],
                    child: const Icon(Icons.book, size: 30),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titulo,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    const SizedBox(height: 4),
                    Text('$creditos Créditos',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 13)),
                    const SizedBox(height: 2),
                    Text('\$${precio.toStringAsFixed(1)}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  esGuardado ? Icons.bookmark : Icons.bookmark_border,
                  color: esGuardado ? Colors.indigo : Colors.grey,
                ),
                onPressed: () {
                  cursoProvider.toggleGuardar(curso);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _obtenerPropiedad(dynamic obj, List<String> props) {
    for (var p in props) {
      try {
        switch (p) {
          case 'titulo':
            return obj.titulo;
          case 'title':
            return obj.title;
          case 'nombre':
            return obj.nombre;
          case 'imagen':
            return obj.imagen;
          case 'image':
            return obj.image;
          case 'urlImagen':
            return obj.urlImagen;
          case 'descripcion':
            return obj.descripcion;
          case 'description':
            return obj.description;
        }
      } catch (_) {}
    }
    return null;
  }

  num _obtenerNum(dynamic obj, List<String> props) {
    for (var p in props) {
      try {
        switch (p) {
          case 'creditos':
            return obj.creditos;
          case 'credits':
            return obj.credits;
          case 'costo':
            return obj.costo;
          case 'precio':
            return obj.precio;
          case 'price':
            return obj.price;
        }
      } catch (_) {}
    }
    return 0;
  }
}
