import 'dart:math';

import 'package:flutter/material.dart';


class SerieMclaurin extends StatefulWidget {
  @override
  State<SerieMclaurin> createState() => _SerieMclaurinScreen();
}



class _SerieMclaurinScreen extends State<SerieMclaurin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _num = TextEditingController();
  TextEditingController _rango = TextEditingController();
  String _resultado = '';

  double factorial(int n) {
    if (n == 0 || n == 1) {
      return 1.0;
    } else {
      return n * factorial(n - 1);
    }
  }


  double calcularSerie(int x, int y){
    double respuesta = 0.0;
    
    for(int i = 0; i <= y; i++){
      respuesta += pow(x, i) / factorial(i);
    }

    return respuesta;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serie de McLaurin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
                controller: _num,
                decoration: InputDecoration(
                  labelText: 'Exponente de la serie',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  final numero = int.tryParse(value);
                  if (numero == null || numero == 0) {
                    return 'Debe ingresar un número entero válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _rango,
                decoration: InputDecoration(
                  labelText: 'Rango de la serie',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un número';
                  }
                  final numero = int.tryParse(value);
                  if (numero == null || numero == 0) {
                    return 'Debe ingresar un número entero válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
            
                    
                    setState(() {
                      _resultado =  'El resultado es: ${calcularSerie(int.parse(_num.text), int.parse(_rango.text))}';
                    });
                  
                },
                child: Text('Calcular'),
              ),
              SizedBox(height: 20),
              Text(
                _resultado,
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}