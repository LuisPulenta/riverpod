import 'package:dio/dio.dart';

class PokemonInformation {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      return response.data['name'] ?? 'Nombre no se encontro';
    } catch (e) {
      return 'Nombre no pudo ser obtenido';
    }
  }
}
