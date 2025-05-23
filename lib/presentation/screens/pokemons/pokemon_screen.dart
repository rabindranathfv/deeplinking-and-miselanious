import 'package:deeplinking_and_miselanious/config/plugins/share_plugin.dart';
import 'package:deeplinking_and_miselanious/constants.dart';
import 'package:deeplinking_and_miselanious/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/domain.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;

  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return pokemonAsync.when(
      data: (pokemon) => _PokemonView(pokemon: pokemon),
      error: (error, stackTrace) => _ErrorWidget(message: error.toString()),
      loading: () => const _LoadingWidget(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
              onPressed: () {
                print('POKEMON.SPRITEFRONT: ${pokemon.spriteFront}');
                // TODO: https://poke-deeplinking-poc.up.railway.app/pokemons/
                // final deepLinking = 'https://poke-deeplinking-poc.up.railway.app/pokemons/${pokemon.id}';
                final deepLinking =
                    '${kDeeplinkBaseUrl}/pokemons/${pokemon.id}';
                print('DEEPLINKING: ${deepLinking}');
                SharePlugin.shareLink(deepLinking, 'Conoce mejor este pókemon');
              },
              icon: const Icon(Icons.share_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              pokemon.spriteFront,
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'ID: ${pokemon.id}',
            ),
            const SizedBox(height: 10),
            Text(
              'Name: ${pokemon.name ?? "Name info is not available"}',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;

  const _ErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Pokemon info not available yet.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              maxLines: 2,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
