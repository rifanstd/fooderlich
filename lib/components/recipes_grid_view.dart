import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipesGridView({Key? key, required this.recipes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: GridView.builder(
            itemCount: recipes.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final simpleRecipe = recipes[index];
              return RecipeThumbnail(recipe: simpleRecipe);
            }));
  }
}
