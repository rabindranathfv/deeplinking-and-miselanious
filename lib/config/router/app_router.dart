import 'package:go_router/go_router.dart';
import 'package:deeplinking_and_miselanious/presentation/screens/screens.dart';

final router = GoRouter(
  redirect: (context, state) {
    final uri = state.uri;
    print('URI ===============>: ${uri}, host: ${uri.host}, path: ${uri.path}, query: ${uri.queryParameters}');

    final target = uri.queryParameters['target'];
    print('TARGET: ${target}');
    if (target != null && target.isNotEmpty) {
      return target;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    // GoRoute(
    //   path: '/permissions',
    //   builder: (context, state) => const PermissionsScreen(),
    // ),

    // //! Sensors
    // GoRoute(
    //   path: '/gyroscope',
    //   builder: (context, state) => const GyroscopeScreen(),
    // ),

    // GoRoute(
    //   path: '/accelerometer',
    //   builder: (context, state) => const AccelerometerScreen(),
    // ),

    // GoRoute(
    //   path: '/magnetometer',
    //   builder: (context, state) => const MagnetometerScreen(),
    // ),

    // GoRoute(
    //   path: '/gyroscope-ball',
    //   builder: (context, state) => const GyroscopeBallScreen(),
    // ),

    // GoRoute(
    //   path: '/compass',
    //   builder: (context, state) => const CompassScreen(),
    // ),

    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            return PokemonScreen(pokemonId: id );
          },
        ),
      ]
    ),
    GoRoute(path: '/excluded', builder: (context, state) => const ExcludedScreen()),
    GoRoute(path: '/user', builder: (context, state) => const UserScreen()),
]);