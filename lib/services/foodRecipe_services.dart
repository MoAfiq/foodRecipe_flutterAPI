import 'package:http/http.dart' as http;
import '../models/foodRecipe_models.dart';

class FoodRecipeService {
  Future<FoodRecipe> fetchFoodRecipeInformation(String foodName) async {
    const String type = 'public';
    const String apiId = 'c5657407';
    const String appKey = '2e1e159c3392b2ec3540039809587675';
    final Uri url = Uri(
        scheme: 'https',
        host: 'api.edamam.com',
        path: 'api/recipes/v2',
        queryParameters: {
          'type': type,
          'q': foodName,
          'app_id': apiId,
          'app_key': appKey,
        });
    print("Request to ${url.toString()}");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return FoodRecipe.fromJson(response.body);
    } else {
      throw Exception('Failed to load Food Recipe information.');
    }
  }
}
