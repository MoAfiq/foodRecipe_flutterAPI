import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = '630dcfa0ed1002b7bf8c20fa86d744e4';
    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q': cityName, 'appId': apiKey, 'units': 'metric'},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load weather information.');
    }
  }
}
