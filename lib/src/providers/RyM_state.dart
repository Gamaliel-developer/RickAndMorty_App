import 'package:get/get.dart';
import 'package:rickandmorty/src/models/RyM_characters_model.dart';
import 'package:rickandmorty/src/providers/RyM_characters_provider.dart';

class RyMState extends GetxController {
  List<RyMModel> personajes = [];
  final personajesProvider = RyMProvider();
  int _pagina = 1;

  Future<void> obtenerPersonajes() async {
    personajes.addAll(await personajesProvider.obtenerPersonajes(_pagina));
    _pagina = _pagina + 1;
    update();
  }
}