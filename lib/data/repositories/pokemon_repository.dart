
//join data and return all pokemon

class PokemonRepository {
  final PokeapiDatasource pokeapiDatasource;
  final LocalDbDatasource localDbDatasource;

  PokemonRepository({required this.pokeapiDatasource, required this.localDbDatasource});

  Future<String> getPokemonDetailsByName(string name) async {
    return await pokeapiDatasource.getPokemonDetailsByName(name);
  }

  //Get all pokemon
  Future<String> getPokemonList() async {
    return await pokeapiDatasource.getPokemonList();
  }

  //Get captured pokemon
  Future<String> getCaptured(String name) async {
    return await localDbDatasource.getCapturedPokemon();
  }
  
}