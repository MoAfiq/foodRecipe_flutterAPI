// To parse this JSON data, do
//
//     final foodRecipe = foodRecipeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'package:http/http.dart';
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
  final FoodRecipeLinks links;
  final List<Hit> hits;

  factory FoodRecipe.fromJson(String str) =>
      FoodRecipe.fromMap(json.decode(str));

  factory FoodRecipe.fromMap(Map<String, dynamic> json) => FoodRecipe(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: FoodRecipeLinks.fromMap(json["_links"]),
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromMap(x))),
      );
}

class Hit {
  Hit({
    required this.recipe,
    required this.links,
  });

  final Recipe recipe;
  final HitLinks links;

  factory Hit.fromJson(String str) => Hit.fromMap(json.decode(str));

  factory Hit.fromMap(Map<String, dynamic> json) => Hit(
        recipe: Recipe.fromMap(json["recipe"]),
        links: HitLinks.fromMap(json["_links"]),
      );
}

class HitLinks {
  HitLinks({
    required this.self,
  });

  final Next self;

  factory HitLinks.fromJson(String str) => HitLinks.fromMap(json.decode(str));

  factory HitLinks.fromMap(Map<String, dynamic> json) => HitLinks(
        self: Next.fromMap(json["self"]),
      );
}

class Next {
  Next({
    required this.href,
    required this.title,
  });

  final String href;
  final Title title;

  factory Next.fromJson(String str) => Next.fromMap(json.decode(str));

  factory Next.fromMap(Map<String, dynamic> json) => Next(
        href: json["href"],
        title: titleValues.map[json["title"]],
      );
}

enum Title { NEXT_PAGE, SELF }

final titleValues =
    EnumValues({"Next page": Title.NEXT_PAGE, "Self": Title.SELF});

class Recipe {
  Recipe({
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
    required this.cautions,
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
    required this.digest,
  });

  final String uri;
  final String label;
  final String image;
  final Images images;
  final String source;
  final String url;
  final String shareAs;
  final int recipeYield;
  final List<DietLabel> dietLabels;
  final List<String> healthLabels;
  final List<Caution> cautions;
  final List<String> ingredientLines;
  final List<Ingredient> ingredients;
  final double calories;
  final double totalWeight;
  final int totalTime;
  final List<CuisineType> cuisineType;
  final List<MealType> mealType;
  final List<DishType> dishType;
  final Map<String, Total> totalNutrients;
  final Map<String, Total> totalDaily;
  final List<Digest> digest;

  factory Recipe.fromJson(String str) => Recipe.fromMap(json.decode(str));

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        images: Images.fromMap(json["images"]),
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: List<DietLabel>.from(
            json["dietLabels"].map((x) => dietLabelValues.map[x])),
        healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
        cautions: List<Caution>.from(
            json["cautions"].map((x) => cautionValues.map[x])),
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromMap(x))),
        calories: json["calories"].toDouble(),
        totalWeight: json["totalWeight"].toDouble(),
        totalTime: json["totalTime"],
        cuisineType: List<CuisineType>.from(
            json["cuisineType"].map((x) => cuisineTypeValues.map[x])),
        mealType: List<MealType>.from(
            json["mealType"].map((x) => mealTypeValues.map[x])),
        dishType: List<DishType>.from(
            json["dishType"].map((x) => dishTypeValues.map[x])),
        totalNutrients: Map.from(json["totalNutrients"])
            .map((k, v) => MapEntry<String, Total>(k, Total.fromMap(v))),
        totalDaily: Map.from(json["totalDaily"])
            .map((k, v) => MapEntry<String, Total>(k, Total.fromMap(v))),
        digest: List<Digest>.from(json["digest"].map((x) => Digest.fromMap(x))),
      );
}

enum Caution { SULFITES }

final cautionValues = EnumValues({"Sulfites": Caution.SULFITES});

enum CuisineType { ITALIAN }

final cuisineTypeValues = EnumValues({"italian": CuisineType.ITALIAN});

enum DietLabel { BALANCED, HIGH_FIBER }

final dietLabelValues = EnumValues(
    {"Balanced": DietLabel.BALANCED, "High-Fiber": DietLabel.HIGH_FIBER});

class Digest {
  Digest({
    required this.label,
    required this.tag,
    required this.schemaOrgTag,
    required this.total,
    required this.hasRdi,
    required this.daily,
    required this.unit,
    required this.sub,
  });

  final String label;
  final String tag;
  final SchemaOrgTag schemaOrgTag;
  final double total;
  final bool hasRdi;
  final double daily;
  final Unit unit;
  final List<Digest> sub;

  factory Digest.fromJson(String str) => Digest.fromMap(json.decode(str));

  factory Digest.fromMap(Map<String, dynamic> json) => Digest(
        label: json["label"],
        tag: json["tag"],
        schemaOrgTag: json["schemaOrgTag"] == null
            ? null
            : schemaOrgTagValues.map[json["schemaOrgTag"]],
        total: json["total"].toDouble(),
        hasRdi: json["hasRDI"],
        daily: json["daily"].toDouble(),
        unit: unitValues.map[json["unit"]],
        sub: json["sub"] == null
            ? null
            : List<Digest>.from(json["sub"].map((x) => Digest.fromMap(x))),
      );
}

enum SchemaOrgTag {
  FAT_CONTENT,
  CARBOHYDRATE_CONTENT,
  PROTEIN_CONTENT,
  CHOLESTEROL_CONTENT,
  SODIUM_CONTENT,
  SATURATED_FAT_CONTENT,
  TRANS_FAT_CONTENT,
  FIBER_CONTENT,
  SUGAR_CONTENT
}

final schemaOrgTagValues = EnumValues({
  "carbohydrateContent": SchemaOrgTag.CARBOHYDRATE_CONTENT,
  "cholesterolContent": SchemaOrgTag.CHOLESTEROL_CONTENT,
  "fatContent": SchemaOrgTag.FAT_CONTENT,
  "fiberContent": SchemaOrgTag.FIBER_CONTENT,
  "proteinContent": SchemaOrgTag.PROTEIN_CONTENT,
  "saturatedFatContent": SchemaOrgTag.SATURATED_FAT_CONTENT,
  "sodiumContent": SchemaOrgTag.SODIUM_CONTENT,
  "sugarContent": SchemaOrgTag.SUGAR_CONTENT,
  "transFatContent": SchemaOrgTag.TRANS_FAT_CONTENT
});

enum Unit { G, MG, UNIT_G, EMPTY, KCAL }

final unitValues = EnumValues({
  "%": Unit.EMPTY,
  "g": Unit.G,
  "kcal": Unit.KCAL,
  "mg": Unit.MG,
  "µg": Unit.UNIT_G
});

enum DishType { MAIN_COURSE }

final dishTypeValues = EnumValues({"main course": DishType.MAIN_COURSE});

class Images {
  Images({
    required this.thumbnail,
    required this.small,
    required this.regular,
    required this.large,
  });

  final Regular thumbnail;
  final Regular small;
  final Regular regular;
  final Regular large;

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        thumbnail: Regular.fromMap(json["THUMBNAIL"]),
        small: Regular.fromMap(json["SMALL"]),
        regular: Regular.fromMap(json["REGULAR"]),
        large: json["LARGE"] == null ? null : Regular.fromMap(json["LARGE"]),
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
        url: json["url"],
        width: json["width"],
        height: json["height"],
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
  final Measure measure;
  final String food;
  final double weight;
  final FoodCategory foodCategory;
  final String foodId;
  final String image;

  factory Ingredient.fromJson(String str) =>
      Ingredient.fromMap(json.decode(str));

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        quantity: json["quantity"].toDouble(),
        measure:
            json["measure"] == null ? null : measureValues.map[json["measure"]],
        food: json["food"],
        weight: json["weight"].toDouble(),
        foodCategory: foodCategoryValues.map[json["foodCategory"]],
        foodId: json["foodId"],
        image: json["image"] == null ? null : json["image"],
      );
}

enum FoodCategory {
  CHEESE,
  EGGS,
  OILS,
  CONDIMENTS_AND_SAUCES,
  CURED_MEATS,
  GRAINS,
  VEGETABLES,
  VEGAN_PRODUCTS,
  WATER,
  COOKED_GRAINS,
  DAIRY,
  WINES
}

final foodCategoryValues = EnumValues({
  "Cheese": FoodCategory.CHEESE,
  "Condiments and sauces": FoodCategory.CONDIMENTS_AND_SAUCES,
  "cooked grains": FoodCategory.COOKED_GRAINS,
  "cured meats": FoodCategory.CURED_MEATS,
  "Dairy": FoodCategory.DAIRY,
  "Eggs": FoodCategory.EGGS,
  "grains": FoodCategory.GRAINS,
  "Oils": FoodCategory.OILS,
  "Vegan products": FoodCategory.VEGAN_PRODUCTS,
  "vegetables": FoodCategory.VEGETABLES,
  "water": FoodCategory.WATER,
  "wines": FoodCategory.WINES
});

enum Measure {
  OUNCE,
  UNIT,
  TABLESPOON,
  GRAM,
  MILLILITER,
  POUND,
  CUP,
  TEASPOON,
  SLICE,
  CLOVE,
  STRIP
}

final measureValues = EnumValues({
  "clove": Measure.CLOVE,
  "cup": Measure.CUP,
  "gram": Measure.GRAM,
  "milliliter": Measure.MILLILITER,
  "ounce": Measure.OUNCE,
  "pound": Measure.POUND,
  "slice": Measure.SLICE,
  "strip": Measure.STRIP,
  "tablespoon": Measure.TABLESPOON,
  "teaspoon": Measure.TEASPOON,
  "<unit>": Measure.UNIT
});

enum MealType { LUNCH_DINNER }

final mealTypeValues = EnumValues({"lunch/dinner": MealType.LUNCH_DINNER});

class Total {
  Total({
    required this.label,
    required this.quantity,
    required this.unit,
  });

  final String label;
  final double quantity;
  final Unit unit;

  factory Total.fromJson(String str) => Total.fromMap(json.decode(str));

  factory Total.fromMap(Map<String, dynamic> json) => Total(
        label: json["label"],
        quantity: json["quantity"].toDouble(),
        unit: unitValues.map[json["unit"]],
      );
}

class FoodRecipeLinks {
  FoodRecipeLinks({
    required this.next,
  });

  final Next next;

  factory FoodRecipeLinks.fromJson(String str) =>
      FoodRecipeLinks.fromMap(json.decode(str));

  factory FoodRecipeLinks.fromMap(Map<String, dynamic> json) => FoodRecipeLinks(
        next: Next.fromMap(json["next"]),
      );
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
