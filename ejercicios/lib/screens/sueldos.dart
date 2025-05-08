import 'package:flutter/material.dart';

// Clase 1: StatefulWidget
class Sueldo extends StatefulWidget {
  @override
  _SueldoState createState() => _SueldoState();
}

// Clase 2: State<Sueldo>
class _SueldoState extends State<Sueldo> {
  final TextEditingController edadController = TextEditingController();
  final TextEditingController aniosController = TextEditingController();
  String resultado = '';

  int calcularSueldo(int edad, int anios) {
    int sumaAnios = (anios * (anios + 1)) ~/ 2; // fórmula de suma de 1 a n
    return 35000 + edad + (100 * sumaAnios);
  }

  void mostrarResultado() {
    final int edad = int.tryParse(edadController.text) ?? 0;
    final int anios = int.tryParse(aniosController.text) ?? 0;

    final int sueldo = calcularSueldo(edad, anios);

    setState(() {
      resultado = 'El sueldo es: \$${sueldo.toString()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora de Sueldo XYZ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: edadController,
              decoration: InputDecoration(labelText: 'Edad del empleado'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: aniosController,
              decoration: InputDecoration(labelText: 'Años en XYZ'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: mostrarResultado,
              child: Text('Calcular sueldo'),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}