import 'package:flutter/material.dart';
import 'package:rickandmorty/src/pages/datos_personaje.dart';
import 'package:rickandmorty/src/pages/home_page.dart';

void main(){
  return runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick And Morty Characters',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(),
        '/datos': (_) => DatosPersonajePage()
      },
    );
  }
}