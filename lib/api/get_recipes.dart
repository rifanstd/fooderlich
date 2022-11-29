import 'dart:convert';
import 'package:fooderlich/models/explore_recipe.dart';
import 'package:fooderlich/models/models.dart%20';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GetRecipes {
  static var URL = 'https://uji.fmipa.unila.ac.id/api-test/recipes.json';

  static Future<List<SimpleRecipe>>getRecipes() async {
    final response = await Dio().get(URL);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;
      if(json['recipes'] != null){
        final recipes = <SimpleRecipe>[];
        json['recipes'].forEach((v) {
          recipes.add(SimpleRecipe.fromJson(v));
        });
        // print(recipes[0].title);
        return recipes;
      }
      else {
        return [];
      }
    }
    else {
      throw('Gagal');
    }
  }
}