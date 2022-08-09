import 'dart:convert';

class FoodRecipe {
  FoodRecipe({
    required this.from,
    required this.to,
    required this.count,
    required this.links,
    required this.hits,
  });
  final int from;
  final int to;
  final int count;
  final RecipeLinks links;
  final List<Hit> hits;

  factory FoodRecipe.fromJson(String str) =>
      FoodRecipe.fromMap(json.decode(str));
  factory FoodRecipe.fromMap(Map<String, dynamic> json) => FoodRecipe(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: RecipeLinks.fromMap(json["_links"]),
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromMap(x))),
      );
}

class Hit {
  Hit({
    required this.recipe,
    required this.links,
  });
  final RecipeClass recipe;
  final HitLinks links;
  factory Hit.fromJson(String str) => Hit.fromMap(json.decode(str));

  factory Hit.fromMap(Map<String, dynamic> json) => Hit(
        recipe: RecipeClass.fromMap(json["recipe"]),
        links: HitLinks.fromMap(json["_links"]),
      );
}

class HitLinks {
  HitLinks({
    required this.self,
  });
  final Self self;
  factory HitLinks.fromJson(String str) => HitLinks.fromMap(json.decode(str));

  factory HitLinks.fromMap(Map<String, dynamic> json) => HitLinks(
        self: Self.fromMap(json["self"]),
      );
}

class Self {
  Self({
    required this.href,
    required this.title,
  });
  final String href;
  final String title;
  factory Self.fromJson(String str) => Self.fromMap(json.decode(str));

  factory Self.fromMap(Map<String, dynamic> json) => Self(
        href: json["href"],
        title: json["title"],
      );
}

class RecipeClass {
  RecipeClass({
    required this.uri,
    required this.label,
    required this.image,
    required this.images,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.recipeYield,
    required this.dietLabels,
    required this.healthLabels,
    required this.ingredientLines,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
    required this.totalNutrients,
    required this.totalDaily,
    // required this.digest,
  });
  final String uri;
  final String label;
  final String image;
  final Images images;
  final String source;
  final String url;
  final String shareAs;
  final int recipeYield;
  final List<String> dietLabels;
  final List<String> healthLabels;
  final List<String> ingredientLines;
  final List<Ingredient> ingredients;
  final double calories;
  final double totalWeight;
  final int totalTime;
  final List<String> cuisineType;
  final List<String> mealType;
  final List<String> dishType;
  final Map<String, Total> totalNutrients;
  final Map<String, Total> totalDaily;
  // final List<Digest> digest;
  factory RecipeClass.fromJson(String str) =>
      RecipeClass.fromMap(json.decode(str));

  factory RecipeClass.fromMap(Map<String, dynamic> json) => RecipeClass(
        uri: json["uri"].toString(),
        label: json["label"].toString(),
        image: json["image"].toString(),
        images: Images.fromMap(json["images"]),
        source: json["source"].toString(),
        url: json["url"].toString(),
        shareAs: json["shareAs"].toString(),
        recipeYield: json["yield"].toInt(),
        dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
        healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromMap(x))),
        calories: json["calories"].toDouble(),
        totalWeight: json["totalWeight"].toDouble(),
        totalTime: json["totalTime"].toInt(),
        cuisineType: List<String>.from(json["cuisineType"].map((x) => x)),
        mealType: List<String>.from(json["mealType"].map((x) => x)),
        dishType: List<String>.from(json["dishType"].map((x) => x)),
        totalNutrients: Map.from(json["totalNutrients"])
            .map((k, v) => MapEntry<String, Total>(k, Total.fromMap(v))),
        totalDaily: Map.from(json["totalDaily"])
            .map((k, v) => MapEntry<String, Total>(k, Total.fromMap(v))),
        // digest: List<Digest>.from(json["digest"].map((x) => Digest.fromMap(x))),
      );
}

// class Digest {
//   Digest({
//     required this.label,
//     required this.tag,
//     required this.total,
//     required this.hasRdi,
//     required this.daily,
//     // required this.unit,
//     required this.sub,
//   });
//   final String label;
//   final String tag;
//   final double total;
//   final bool hasRdi;
//   final double daily;
//   // final Unit unit;
//   final List<Digest> sub;
//   factory Digest.fromJson(String str) => Digest.fromMap(json.decode(str));
//
//   factory Digest.fromMap(Map<String, dynamic> json) => Digest(
//         label: json["label"].toString(),
//         tag: json["tag"].toString(),
//         total: json["total"].toDouble(),
//         hasRdi: json["hasRDI"],
//         daily: json["daily"].toDouble(),
//         // unit: unitValues.map[json["unit"]]!,
//         sub: List<Digest>.from(json["sub"].map((x) => Digest.fromMap(x))),
//       );
// }

// enum Unit { G, MG, UNIT_G, EMPTY, KCAL }
//
// final unitValues = EnumValues({
//   "%": Unit.EMPTY,
//   "g": Unit.G,
//   "kcal": Unit.KCAL,
//   "mg": Unit.MG,
//   "µg": Unit.UNIT_G
// });

class Images {
  Images({
    required this.thumbnail,
    required this.small,
    required this.regular,
  });
  final Regular thumbnail;
  final Regular small;
  final Regular regular;
  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        thumbnail: Regular.fromMap(json["THUMBNAIL"]),
        small: Regular.fromMap(json["SMALL"]),
        regular: Regular.fromMap(json["REGULAR"]),
      );
}

class Regular {
  Regular({
    required this.url,
    required this.width,
    required this.height,
  });
  final String url;
  final int width;
  final int height;
  factory Regular.fromJson(String str) => Regular.fromMap(json.decode(str));

  factory Regular.fromMap(Map<String, dynamic> json) => Regular(
        url: json["url"].toString(),
        width: json["width"].toInt(),
        height: json["height"].toInt(),
      );
}

class Ingredient {
  Ingredient({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.weight,
    required this.foodCategory,
    required this.foodId,
    required this.image,
  });
  final String text;
  final double quantity;
  final String measure;
  final String food;
  final double weight;
  final String foodCategory;
  final String foodId;
  final String image;
  factory Ingredient.fromJson(String str) =>
      Ingredient.fromMap(json.decode(str));

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
        text: json["text"].toString(),
        quantity: json["quantity"].toDouble(),
        measure: json["measure"].toString(),
        food: json["food"].toString(),
        weight: json["weight"].toDouble(),
        foodCategory: json["foodCategory"].toString(),
        foodId: json["foodId"].toString(),
        image: json["image"].toString(),
      );
}

class Total {
  Total({
    required this.label,
    required this.quantity,
    // required this.unit,
  });
  final String label;
  final double quantity;
  // final Unit unit;
  factory Total.fromJson(String str) => Total.fromMap(json.decode(str));

  factory Total.fromMap(Map<String, dynamic> json) => Total(
        label: json["label"].toString(),
        quantity: json["quantity"].toDouble(),
        // unit: unitValues.map[json["unit"]]!,
      );
}

class RecipeLinks {
  RecipeLinks();
  factory RecipeLinks.fromJson(String str) =>
      RecipeLinks.fromMap(json.decode(str));

  factory RecipeLinks.fromMap(Map<String, dynamic> json) => RecipeLinks();
}

class EnumValues<T> {
  Map<String, T> map;
  EnumValues(this.map);
}
