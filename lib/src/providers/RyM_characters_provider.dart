import 'package:dio/dio.dart';
import 'package:rickandmorty/src/models/RyM_characters_model.dart';

class RyMProvider {
  final _url = 'https://rickandmortyapi.com/api/character';
  final _http = Dio();

  Future<List<RyMModel>> obtenerPersonajes(int pagina) async {
    final response = await _http.get(_url, queryParameters: {'page': pagina});
    List<dynamic> data = response.data['results'];
    
    return data.map((_personajes) => RyMModel.fromMapJson(_personajes)).toList();  
  }

  Future<RyMModel> personajePorIdoNombre(String query) async {
    final response = await _http.get('$_url/$query');
    return RyMModel.fromMapJson(response.data);
  }
}
