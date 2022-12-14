import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' show Client, Response;
import 'package:minggu_10_moviedb/model/popular_movies.dart'; 

class ApiProvider {
  String apiKey = '0fc57401';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    //String url = '$baseUrl/movie/popular?api_key=$apiKey';
    // print(url);
    Response response = 
      await client.get('$baseUrl/movie/popular?api_key=$apiKey');
      if (response.statusCode == 200) {
        return PopularMovies.formJson(jsonDecode(response.body));
      } else {
        throw Exception(response.statusCode);
      }
  }
}