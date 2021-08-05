import 'package:flutter/material.dart';
import 'package:rickandmorty/src/models/RyM_characters_model.dart';
import 'package:rickandmorty/src/providers/RyM_characters_provider.dart';

class BuscarPersonajes extends SearchDelegate {
  final _rymProvider = RyMProvider();
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.delete), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return (query != '')
        ? FutureBuilder(
            future: _rymProvider.personajePorIdoNombre(query),
            builder: (BuildContext context, AsyncSnapshot<RyMModel> snapShot) {
              final personajes = snapShot.data;
              if (snapShot.hasData) {
                return ListTile(
                  onTap: () => Navigator.pushNamed(context, '/datos',arguments: personajes),
                  leading: Image.network(personajes!.image!),
                  title: Text(personajes.name!),
                  subtitle: Text(personajes.id.toString()),
                );
              } else {
                return Container(
                  margin:EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                );
              }
            },
          )
        : Container();
  }
}