import 'package:deeplinking_and_miselanious/domain/domain.dart';
import 'package:deeplinking_and_miselanious/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonsRepositoryProvider = Provider<PokemonRepository>((ref) {
  return PokemonsRepositoryImpl();
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final pokemonRepository = ref.watch( pokemonsRepositoryProvider );
  final ( pokemon, error ) = await pokemonRepository.getPokemon(id);
  if ( pokemon != null ) return pokemon;

  throw error;
});