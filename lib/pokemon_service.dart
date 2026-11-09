import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonService {

  Future<Map<String, dynamic>> obtenerPokemon() async {

    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar Pokémon');
    }
  }
}