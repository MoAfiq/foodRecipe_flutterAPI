import 'package:http/http.dart' as http;
import '../models/foodRecipe_models.dart';

class FoodRecipeService {
  Future<FoodRecipe> fetchFoodRecipeInformation(String foodName) async {
    const String apiId = '9d080be9';
    const String appKey = '04f909cf7f5cb39fc01790387268d106';
    final Uri url = Uri(
        scheme: 'https',
        host: 'api.edamam.com',
        path: 'api/recipes/v2',
        queryParameters: {
          'q': foodName,
          'api_id': apiId,
          'app_key': appKey,
        });

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return FoodRecipe.fromJson(response.body);
    } else {
      throw Exception('Failed to load Food Recipe information.');
    }
  }
}
