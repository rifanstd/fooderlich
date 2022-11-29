import 'package:flutter/material.dart';
import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;
  const RecipeThumbnail({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
                  child: Image.network(
                    '${recipe.dishImage}',
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12))),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title.toString(),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    recipe.duration.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined),
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
