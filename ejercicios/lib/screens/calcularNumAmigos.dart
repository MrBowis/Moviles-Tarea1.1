import 'package:flutter/material.dart';

class CalcularNumamigos extends StatefulWidget{
  @override
  State<CalcularNumamigos> createState() => _CalcularNumamigosState();
}

class _CalcularNumamigosState extends State<CalcularNumamigos>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();
  String _resultado = '';

  

  bool sonAmigos(int num1, int num2){
    return sumaDivisores(num1) == num2 && sumaDivisores(num2) == num1;
  }

  int sumaDivisores(int num){
    int suma = 0;
    for(int i = 1; i<=num ~/ 2; i++){
      if(num % i == 0){
        suma += i;
      }
    }
    return suma;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular números amigos'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(     
            children: [
              TextFormField(
                controller: _num1,
                decoration: InputDecoration(
                  labelText: 'Número 1',
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
                controller: _num2,
                decoration: InputDecoration(
                  labelText: 'Número 2',
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
                  if (_formKey.currentState!.validate()) {
                    final num1 = int.parse(_num1.text);
                    final num2 = int.parse(_num2.text);
                    final amigos = sonAmigos(num1, num2);
                    setState(() {
                      _resultado = amigos ? 'Son amigos' : 'No son amigos';
                    });
                  }
                },
                child: Text('Verificar'),
              ),
              SizedBox(height: 20),
              Text(
                _resultado,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

}