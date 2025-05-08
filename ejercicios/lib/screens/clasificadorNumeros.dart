import 'package:flutter/material.dart';

class ClasificadorNumeros extends StatefulWidget {
  @override
  _ClasificadorNumerosState createState() => _ClasificadorNumerosState();
}

class _ClasificadorNumerosState extends State<ClasificadorNumeros> {
  final TextEditingController numeroController = TextEditingController();
  List<int> numeros = [];

  int menores15 = 0;
  int mayores50 = 0;
  int entre25y45 = 0;

  void agregarNumero() {
    final int? numero = int.tryParse(numeroController.text);

    if (numero != null && numero >= 0) {
      numeros.add(numero);

      if (numero < 15) menores15++;
      if (numero > 50) mayores50++;
      if (numero >= 25 && numero <= 45) entre25y45++;

      numeroController.clear();
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, ingresa un número natural válido')),
      );
    }
  }

  double obtenerPromedio() {
    if (numeros.isEmpty) return 0.0;
    return numeros.reduce((a, b) => a + b) / numeros.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clasificador de Números')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              decoration: InputDecoration(labelText: 'Ingresa un número natural'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: agregarNumero,
              child: Text('Agregar número'),
            ),
            SizedBox(height: 20),
            Text('Cantidad de números ingresados: ${numeros.length}'),
            Text('Menores que 15: $menores15'),
            Text('Mayores que 50: $mayores50'),
            Text('Entre 25 y 45: $entre25y45'),
            Text('Promedio: ${obtenerPromedio().toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}