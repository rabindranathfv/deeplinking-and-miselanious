import 'package:deeplinking_and_miselanious/domain/entities/pokemon.dart';

abstract class PokemonsDatasource {
  Future<( Pokemon?, String )> getPokemon( String id );
}