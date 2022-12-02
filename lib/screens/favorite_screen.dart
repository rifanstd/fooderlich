import 'package:flutter/material.dart';
import 'package:fooderlich/database/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../components/circle_image.dart';
import '../models/models.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  DBHelper dbHelper = DBHelper();
  List<SimpleRecipe> recipes = [];

  @override
  void initState() {
    super.initState();
    _getAllRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Recipes",
        ),
        // automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          SimpleRecipe recipe = recipes[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        recipe.dishImage.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipe.title.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              recipe.duration.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        // IconButton(
                        //   onPressed: () async {
                        //     await dbHelper.deleteRecipe(recipe.id.toString());
                        //     setState(() {
                        //       _getAllRecipes();
                        //     });
                        //     final snackBar = SnackBar(
                        //       content: Text(recipe.title.toString() +
                        //           " dihapus dari favorite."),
                        //     );
                        //     ScaffoldMessenger.of(context)
                        //         .showSnackBar(snackBar);
                        //   },
                        //   icon: Icon(Icons.delete),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _getAllRecipes() async {
    var list = await dbHelper.getAllRecipes();
    setState(() {
      recipes.clear();
      list!.forEach((recipe) {
        recipes.add(SimpleRecipe.fromMap(recipe));
      });
    });
  }

  // Future<void> _deleteRecipe(String id) async {
  //   await dbHelper.deleteRecipe(id);
  //   setState(() {});
  // }
}
