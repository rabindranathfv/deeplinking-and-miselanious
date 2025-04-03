import 'package:deeplinking_and_miselanious/domain/domain.dart';
import 'package:deeplinking_and_miselanious/infrastructure/mappers/pokemon_mapper.dart';
import 'package:dio/dio.dart';

class PokemonsDatasourceImpl implements PokemonsDatasource {
  final Dio dio;

  PokemonsDatasourceImpl()
    : dio = Dio( BaseOptions(baseUrl: 'https://pokeapi.co/api/v2') );

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final resp = await dio.get('/pokemon/$id');
      final pokemon = PokemonMapper.pokeApiPokemonToEntity( resp.data );

      return ( pokemon, 'Data obtenida correctamente' );
    } catch (e) {
      return ( null, 'No se pudo obtener el pokémon $e' );
    }
  }
}