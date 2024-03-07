import 'package:http/http.dart' as http;

class PokeapiDatasource {
  final http.Client client;

  PokeapiDatasource({required this.client});

  Future<String> getPokemonList() async {
    final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0'));
    return response.body;
  }

  Future<String> getPokemonDetailsById(int id) async {
    final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id/'));
    return response.body;
  }

  Future<String> getPokemonDetailsByName(String name) async {
    final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name/'));
    return response.body;
  }

  //Sprite from official-artwork
  Future<String> getPokemonSpriteById(int id) async {
    final response = await client.get(Uri.parse('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png'));
    return response.body;
  }
}