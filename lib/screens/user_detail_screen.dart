import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final TextEditingController _commentController = TextEditingController();

  Future<void> _abrirGithub() async {
    final Uri url = Uri.parse('https://github.com');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir el enlace de GitHub')),
        );
      }
    }
  }

  void _enviarComentario() {
    if (_commentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, escribe un comentario antes de enviar.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _commentController.clear();
    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text('¡Mensaje enviado!'),
          ],
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  // Widget para el Collage de Imagenes / Proyectos
  Widget _buildCollageProyectos() {
    final List<String> imagenes = [
      'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500',
      'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=500',
      'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=500',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Proyectos y Enfoque Técnico',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 180,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    imagenes[0],
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: Colors.grey[300]),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          imagenes[1],
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              Container(color: Colors.grey[400]),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Image.network(
                          imagenes[2],
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              Container(color: Colors.grey[500]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text(
            'Carlos Andrés Paredes León',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Estudiante de Ingeniería en Sistemas',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Tarjeta Académica
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.school, color: Colors.indigo),
                    title: Text('Universidad'),
                    subtitle: Text('Universidad Tecnológica ECOTEC'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.indigo),
                    title: Text('Enfoque Técnico'),
                    subtitle:
                        Text('Desarrollo Móvil (Flutter/Dart), ML y Backend'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Collage de Imágenes de Proyectos
          _buildCollageProyectos(),
          const SizedBox(height: 20),

          // Botón GitHub
          ElevatedButton.icon(
            onPressed: _abrirGithub,
            icon: const Icon(Icons.code),
            label: const Text('Ver Perfil en GitHub'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Caja de Comentarios
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dejar un Comentario',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _commentController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje o sugerencia aquí...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _enviarComentario,
                      icon: const Icon(Icons.send),
                      label: const Text('Enviar Comentario'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
