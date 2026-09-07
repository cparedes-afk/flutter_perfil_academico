import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';
import 'user_detail_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // Cambiamos el índice inicial a 3 para que 'Perfil' sea la pantalla principal al abrir
  int _selectedIndex = 3;

  // Lista de títulos dinámicos para la AppBar
  final List<String> _titulos = [
    'Mi Matrícula',
    'Catálogo de Cursos',
    'Mis Cursos Guardados',
    'Perfil Académico',
  ];

  final List<Widget> _pantallas = [
    const ProfileScreen(),
    const HomeScreen(),
    const FavoritesScreen(),
    const UserDetailScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulos[_selectedIndex]),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.indigo,
            child: Icon(Icons.school, color: Colors.white, size: 20),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No tienes notificaciones pendientes.'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: _pantallas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Resumen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Guardados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
