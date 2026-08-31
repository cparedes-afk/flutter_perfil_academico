import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MiPortafolioApp());
}

class MiPortafolioApp extends StatelessWidget {
  const MiPortafolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio Académico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A365D),
          primary: const Color(0xFF1A365D),
          secondary: const Color(0xFF2B6CB0),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// -----------------------------------------------------------------------------
// NAVEGACIÓN PRINCIPAL (1. Pantallas & 3. Interacción - Navegación)
// -----------------------------------------------------------------------------
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SkillsScreen(),
    ProjectsScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2B6CB0),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'Habilidades'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Proyectos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: 'Contacto'),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PANTALLA 1: PERFIL / INICIO
// -----------------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil Académico',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: const Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF2B6CB0),
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            SizedBox(height: 12),
            const Text(
              'Carlos Andrés Paredes León',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('Estudiante de Ingeniería en Sistemas / Desarrollo SW',
                style: TextStyle(color: Colors.grey)),
            const Divider(height: 30, thickness: 1),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.school, color: Color(0xFF1A365D)),
                      title: Text('Universidad'),
                      subtitle: Text('Universidad Tecnológica ECOTEC'),
                    ),
                    ListTile(
                      leading: Icon(Icons.star, color: Color(0xFF1A365D)),
                      title: Text('Enfoque Técnico'),
                      subtitle:
                          Text('Desarrollo Móvil (Flutter/Dart), ML y Backend'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PANTALLA 2: HABILIDADES TÉCNICAS (Colores e Iconos Personalizados)
// -----------------------------------------------------------------------------
class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  bool _showAdvanced = true;

  final List<Map<String, dynamic>> _skills = const [
    {
      'name': 'Flutter & Dart',
      'level': 'Avanzado',
      'type': 'Móvil',
      'icon': Icons.phone_android,
      'color': Color(0xFF02569B),
    },
    {
      'name': 'Python & ML',
      'level': 'Intermedio',
      'type': 'Data',
      'icon': Icons.analytics,
      'color': Color(0xFF3776AB),
    },
    {
      'name': 'PHP & MySQL',
      'level': 'Avanzado',
      'type': 'Backend',
      'icon': Icons.storage,
      'color': Color(0xFF4F5B93),
    },
    {
      'name': 'Linux & Git',
      'level': 'Intermedio',
      'type': 'DevOps',
      'icon': Icons.terminal,
      'color': Color(0xFF24292E),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habilidades Técnicas',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(_showAdvanced ? Icons.visibility : Icons.visibility_off),
            onPressed: () => setState(() => _showAdvanced = !_showAdvanced),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            if (_showAdvanced)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Lenguajes de Programación.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF1A365D), fontWeight: FontWeight.w500),
                ),
              ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _skills.length,
                itemBuilder: (context, index) {
                  final skill = _skills[index];
                  return Card(
                    elevation: 4,
                    color: skill['color'] as Color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            skill['icon'] as IconData,
                            color: Colors.white,
                            size: 42,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            skill['name'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              skill['level'] as String,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PANTALLA 3: PROYECTOS (ListView, Card, AlertDialog y setState para Favoritos)
// -----------------------------------------------------------------------------
class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'Perfil Académico Mobile',
      'desc': 'App móvil en Flutter con UI interactiva.',
      'fav': false
    },
    {
      'title': 'Sistema de Gestión PHP',
      'desc': 'CRUD completo integrado con MySQL y Git.',
      'fav': false
    },
    {
      'title': 'IA e interacción con BOTs',
      'desc': 'Creación de Bots en Telegram acompañado de IA.',
      'fav': false
    },
  ];

  void _showDetailDialog(String title, String desc) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyectos Integradores',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          final item = _projects[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading:
                  const Icon(Icons.folder_special, color: Color(0xFF2B6CB0)),
              title: Text(item['title']),
              subtitle: Text(item['desc']),
              trailing: IconButton(
                icon: Icon(
                  item['fav'] ? Icons.star : Icons.star_border,
                  color: item['fav'] ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  setState(() => item['fav'] = !item['fav']); // 6. setState
                },
              ),
              onTap: () => _showDetailDialog(
                  item['title'], item['desc']), // 3. AlertDialog
            ),
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PANTALLA 4: CONTACTO (Formulario, SnackBar y uso de url_launcher)
// -----------------------------------------------------------------------------
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('No se pudo abrir $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController msgController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacto y Redes',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Envía un mensaje directo:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: msgController,
              decoration: const InputDecoration(
                labelText: 'Mensaje o consulta',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A365D),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.send),
              label: const Text('Enviar Mensaje'),
              onPressed: () {
                if (msgController.text.isNotEmpty) {
                  msgController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('¡Mensaje enviado con éxito!')), // 3. SnackBar
                  );
                }
              },
            ),
            const Divider(height: 40),
            const Text('Redes Académicas / Enlaces:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.code),
              label: const Text('Abrir Perfil de GitHub'),
              onPressed: () =>
                  _openUrl('https://github.com'), // 5. Paquete externo
            ),
          ],
        ),
      ),
    );
  }
}
