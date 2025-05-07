import 'package:flutter/material.dart';
import '/screens/calcularNumAmigos.dart';
import '/screens/paginaPrincipal.dart';
import '/screens/serieMclaurin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaginaPrincipal(),
      routes: {
        '/calcularNumAmigos': (context) => CalcularNumamigos(),
        '/serieMclaurin': (context) => SerieMclaurin(),
      },
    );
  }
}
