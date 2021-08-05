import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/src/providers/RyM_state.dart';
import 'package:rickandmorty/src/buscador/buscador.dart';

class HomePage extends StatefulWidget{
  
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  bool _cargando = false;
  @override
  void initState() {
    final personajeState = Get.put(RyMState());
    personajeState.obtenerPersonajes();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        if (_cargando == false) {
          setState(() {
            _cargando = true;
          });
          await personajeState.obtenerPersonajes();
          setState(() {
            _cargando = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RyMState>(builder: (RyMState personajeState) {
      return Scaffold(appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Image.asset('assets/Logo.png', scale: 4.0,),
      ),
      body: Container(
        color: Colors.blue[100],
        child: ListView.builder(
          controller: _scrollController,
          itemCount: personajeState.personajes.length,
          itemBuilder: (BuildContext context, int i){
            final _personajes = personajeState.personajes[i];
            return Card(
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, '/datos', arguments: _personajes),
                leading: Image.network(_personajes.image!),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                title:Text('Character: ${_personajes.id}') ,
                subtitle: Text(_personajes.name!),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showSearch(context: context, delegate: BuscarPersonajes());
        },
        child: Icon(Icons.search),
        backgroundColor: Colors.green,
      ),
    );
    });
  }
}

