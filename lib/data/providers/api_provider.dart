import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;



class ApiProvider{
  final String baseUrl = 'https://api.themoviedb.org/3/account/6d7f159f5fe1495f52f18b81324552c9';
  final box = GetStorage();

  Future<http.Response> getAllMovies () async {
    final Uri uri = Uri.parse('$baseUrl/users/command/${box.read('id')}');

    var response = await http.get(uri).timeout(const Duration(seconds: 20));
    return response;
  }
}
  
