import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const PerfilApp());

class PerfilApp extends StatefulWidget {
  const PerfilApp({super.key});

  @override
  State<PerfilApp> createState() => _PerfilAppState();
}

class _PerfilAppState extends State<PerfilApp> {
  bool _esModoOscuro = false;
  bool _siguiendo = false;
  int _seguidores = 120;
  int _likes = 15;
  bool _dioLike = false;

  void _mostrarPerfilAcademico(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Información Académica',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Estudiante:',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Text(
                'Carlos Andres Paredes Leon',
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 10),
              Text(
                'Universidad:',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Text(
                'Universidad Tecnológica ECOTEC',
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(height: 10),
              Text(
                'Materia:',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Text(
                'Programación IV',
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                'Cerrar',
                style: GoogleFonts.poppins(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _esModoOscuro ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Perfil Académico',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(_esModoOscuro ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _esModoOscuro = !_esModoOscuro;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.deepPurple,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Carlos Paredes',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Estudiante de Ingeniería en Sistemas',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '$_seguidores',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Seguidores',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        Text(
                          '$_likes',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Likes',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _siguiendo ? Colors.grey[300] : Colors.deepPurple,
                        foregroundColor:
                            _siguiendo ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _siguiendo = !_siguiendo;
                          _seguidores += _siguiendo ? 1 : -1;
                        });
                      },
                      child: Text(
                        _siguiendo ? 'Siguiendo' : 'Seguir',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        _dioLike ? Icons.favorite : Icons.favorite_border,
                        color: _dioLike ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _dioLike = !_dioLike;
                          _likes += _dioLike ? 1 : -1;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Builder(
                  builder: (BuildContext btnContext) {
                    return ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () => _mostrarPerfilAcademico(btnContext),
                      icon: const Icon(Icons.school),
                      label: Text(
                        'Ver Datos Académicos',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
