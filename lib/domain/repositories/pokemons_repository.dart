import 'package:deeplinking_and_miselanious/domain/domain.dart';

abstract class PokemonRepository {
  Future<( Pokemon?, String )> getPokemon( String id );
}