import 'package:deeplinking_and_miselanious/domain/domain.dart';
import 'package:deeplinking_and_miselanious/infrastructure/datasources/pokemons_datasource_impl.dart';

class PokemonsRepositoryImpl implements PokemonRepository {

  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl({ PokemonsDatasource? datasource })
    : datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return datasource.getPokemon(id);
  }

}