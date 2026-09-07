import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_perfil_academico/main.dart';

void main() {
  testWidgets('Carga inicial del proyecto', (WidgetTester tester) async {
    // Reconstruye el widget principal MyApp
    await tester.pumpWidget(const MyApp());
  });
}
