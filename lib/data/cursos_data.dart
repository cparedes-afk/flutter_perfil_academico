import '../models/curso.dart';

final List<Curso> cursosDisponibles = [
  Curso(
    id: 'c1',
    nombre: 'Desarrollo Móvil con Flutter',
    precio: 150.0,
    imagen: 'https://picsum.photos/id/1/400/300',
    creditos: 4,
    descripcion:
        'Aprende a construir aplicaciones multiplataforma con Dart y Flutter.',
  ),
  Curso(
    id: 'c2',
    nombre: 'Base de Datos SQL Server',
    precio: 120.0,
    imagen: 'https://picsum.photos/id/180/400/300',
    creditos: 3,
    descripcion:
        'Administración, consultas avanzadas y optimización de bases de datos.',
  ),
  Curso(
    id: 'c3',
    nombre: 'Administración de Linux Server',
    precio: 135.0,
    imagen: 'https://picsum.photos/id/119/400/300',
    creditos: 4,
    descripcion:
        'Configuración de servidores Ubuntu, redes, LVM y servicios web.',
  ),
  Curso(
    id: 'c4',
    nombre: 'Ciencia de Datos con Python',
    precio: 160.0,
    imagen: 'https://picsum.photos/id/60/400/300',
    creditos: 5,
    descripcion:
        'Procesamiento de datos, análisis exploratorio y modelos con Scikit-Learn.',
  ),
];
