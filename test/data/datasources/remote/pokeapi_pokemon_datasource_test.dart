import 'package:flutter_pokedex/data/datasources/remote/pokeapi_pokemon_datasource.dart';
import 'package:flutter_pokedex/domain/entities/app_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oxidized/oxidized.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}
// class MockPokeapiDatasource extends Mock implements PokeapiDatasource {}

void main() {
  group("PokeapiPokemonDatasource -", () {
    //
    late PokeapiDatasource pokeapiDatasource;
    late MockHttpClient mockHttpClient;

    setUp(() {
      pokeapiDatasource = PokeapiDatasource();
      mockHttpClient = MockHttpClient();
    });
    setUpAll(() {});

    group("when calling getPokemonList()", () {
      group("Given the response status code is 200", () {
        test(
            "Should return a future of a result of a list of records with name and url of the pokemon",
            () async {
              // Arrange
              when(() => mockHttpClient
                  .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0')))
                  .thenAnswer((_) async => http.Response(
                    '{"results":[{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"}]}',
                    200,
                  ));
              // Act
              final pokemonListData = await PokeapiDatasource().getPokemonList();
              // Assert
              expect(pokemonListData, isA<Ok<List<(String, String)>, AppException>>());
        });
      });
    });

    group("getPokemonDetailsByName", () {});
  });
}
