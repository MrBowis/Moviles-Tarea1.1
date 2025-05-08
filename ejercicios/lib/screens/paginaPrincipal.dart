import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicios'),
        backgroundColor: Colors.cyan, 
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/sueldos');
              }, 
              child: Text('Ejercicio 16'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/clasificadorNumeros');
              }, 
              child: Text('Ejercicio 17'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/calcularNumAmigos');
              }, 
              child: Text('Ejercicio 18'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/serieMclaurin');
              }, 
              child: Text('Ejercicio 22'),
            ),
          ],
        ),
      )

    );

  }
}