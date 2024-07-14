import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

//-------------------------------------------------------------------
final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

//-------------------------------------------------------------------
final pokemonNameProvider = FutureProvider<String>((ref) async {
  // final pokemonName = await PokemonInformation.getPokemonName(1);
  // return pokemonName;

  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
});

//-------------------------------------------------------------------
final pokemonProvider =
    FutureProvider.family<String, int>((ref, pokemonId) async {
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
});
