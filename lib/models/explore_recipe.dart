part 'ingredient.dart';
part 'instruction.dart';

class RecipeCardType {
  static const String card1 = 'card1';
  static const String card2 = 'card2';
  static const String card3 = 'card3';
}

class ExploreRecipe {
  late String cardType;
  late String title;
  late String subtitle;
  late String backgroundImage;
  late String backgroundImageSource;
  late String message;
  late String authorName;
  late String role;
  late String profileImage;
  late int durationInMinutes;
  late String dietType;
  late int calories;
  late List<String> tags;
  late String description;
  late String source;
  late List<Ingredients> ingredients;
  late List<Instruction> instructions;

  ExploreRecipe(
      {required this.cardType,
      required this.title,
      required this.subtitle,
      required this.backgroundImage,
      required this.backgroundImageSource,
      required this.message,
      required this.authorName,
      required this.role,
      required this.profileImage,
      required this.durationInMinutes,
      required this.dietType,
      required this.calories,
      required this.tags,
      required this.description,
      required this.source,
      required this.ingredients,
      required this.instructions});

  ExploreRecipe.fromJson(Map<String, dynamic> json) {
    cardType = json['cardType'];
    title = json['title'];
    subtitle = json['subtitle'];
    backgroundImage = json['backgroundImage'];
    backgroundImageSource = json['backgroundImageSource'];
    message = json['message'];
    authorName = json['authorName'];
    role = json['role'];
    profileImage = json['profileImage'];
    durationInMinutes = json['durationInMinutes'];
    dietType = json['dietType'];
    calories = json['calories'];
    tags = json['tags'].cast<String>();
    description = json['description'];
    source = json['source'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients.add(Ingredients.fromJson(v));
      });
    }
    if (json['instructions'] != null) {
      instructions = <Instruction>[];
      json['instructions'].forEach((v) {
        instructions.add(Instruction.fromJson(v));
      });
    }
  }
}
