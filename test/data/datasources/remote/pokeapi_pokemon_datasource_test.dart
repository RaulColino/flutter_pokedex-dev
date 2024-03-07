import 'package:flutter_pokedex/data/datasources/remote/pokeapi_pokemon_datasource.dart';
import 'package:flutter_pokedex/domain/entities/app_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}
// class MockPokeapiDatasource extends Mock implements PokeapiDatasource {}

void main() {
  group("PokeapiPokemonDatasource -", () {
    late MockHttpClient mockHttpClient;
    late PokeapiDatasource pokeapiDatasource;

    setUp(() {
      mockHttpClient = MockHttpClient();
      pokeapiDatasource = PokeapiDatasource(httpClient: mockHttpClient);
    });
    setUpAll(() {});

    group("when calling getPokemonList()", () {
      group("Given the response status code is 200", () {
        test(
            "Should return a future of a OK result with a list of records with the name and url of the pokemon",
            () async {
          // Arrange
          when(() => mockHttpClient
                  .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0')))
              .thenAnswer((_) async => http.Response(
                    '{"results":[{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"}]}',
                    200,
                  ));
          // Act
          final pokemonListData = await pokeapiDatasource.getPokemonList();
          // Assert
          expect(pokemonListData.isOk(), true);
          if (pokemonListData.isOk()) {
            expect(pokemonListData.unwrap(), isA<List<(String, String)>>());
          } else {
            fail("The result is not OK");
          }
        });
      });
      group("Given the response status code is NOT 200", () {
        test(
            "Should return a future of a Err result with an AppException with the type AppExceptionType.api",
            () async {
          // Arrange
          when(() => mockHttpClient
                  .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0')))
              .thenAnswer((_) async => http.Response(
                    '{}',
                    404,
                  ));
          // Act
          final pokemonListData = await pokeapiDatasource.getPokemonList();
          // Assert
          expect(pokemonListData.isErr(), true);
          if (pokemonListData.isErr()) {
            expect(pokemonListData.unwrapErr(), isA<AppException>());
            expect(pokemonListData.unwrapErr().type, AppExceptionType.api);
          } else {
            fail("The result is not Err");
          }
        });
      });
    });

    group("getPokemonDetailsByName", () {});
  });
}
