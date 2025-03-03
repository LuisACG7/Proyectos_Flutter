import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffb74093),
          title: const Text('Hola Mundo :)',
           style: TextStyle(
            fontSize: 30,
            fontFamily: 'SWar',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
          ), 
          centerTitle: true, // Propiedad para centrar el título
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ads_click, color: Colors.teal, size: 60,),
          onPressed: (){
            contador++;
            print(contador);
            setState(() {});
            } 
          ),
        body:  Center(
          child: Text('Valor del contador $contador',
          style: TextStyle(fontSize: 20),)
          )
      ),
    );
  }
}