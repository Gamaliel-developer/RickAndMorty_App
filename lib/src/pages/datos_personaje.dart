import 'package:flutter/material.dart';
import 'package:rickandmorty/src/models/RyM_characters_model.dart';

class DatosPersonajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RyMModel _personaje = ModalRoute.of(context)!.settings.arguments as RyMModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.blue[100],
        child: ListView(
          children: [
            SizedBox(height: 20.0),
            _Imagen(_personaje),
            SizedBox(height: 20.0),
            _DatosPersonaje(_personaje),
            SizedBox(height: 50.0),
          ],
        ),
      )
    );
  }
}

class _DatosPersonaje extends StatelessWidget {
  final RyMModel personaje;
  _DatosPersonaje(this.personaje);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 15.0,
      shadowColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Positioned(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Name:", style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25.0)),
              Text(personaje.name!, style: TextStyle(color: Colors.black, fontSize: 20.0)),
              SizedBox(height: 10.0,),
              Text("Status:", style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25.0)),
              Text(personaje.status!, style: TextStyle(color: Colors.black, fontSize: 20.0)),
              SizedBox(height: 10.0,),
              Text("Species:", style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25.0)),
              Text(personaje.species!, style: TextStyle(color: Colors.black, fontSize: 20.0)),
              SizedBox(height: 10.0,),
              Text("Gender:", style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25.0)),
              Text(personaje.gender!, style: TextStyle(color: Colors.black, fontSize: 20.0)),
              SizedBox(height: 10.0,),
              Text("Type (The type or subspecies of the character):", style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25.0)),
              Text(personaje.type!, style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Imagen extends StatelessWidget {
  final RyMModel personaje;
  _Imagen(this.personaje);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 70.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image.network(personaje.image!, scale: 1.5,)
          ]
        ),
      ),
    );
  }
}