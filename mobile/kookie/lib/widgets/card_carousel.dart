import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:kookie/api/recipe_api_client.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/recette/RecetteThumbnailDTO.dart';
import 'package:kookie/repositories/profile_repository.dart';
import 'package:kookie/screens/recipe_detail_screen.dart';

import 'custom_dialog.dart';

class CardCarousel extends StatefulWidget {
  final String title;
  final List<RecetteThumbnailDTO> recipes;

  const CardCarousel({required this.recipes, this.title = ''});

  @override
  CardCarouselState createState() => CardCarouselState();
}

class CardCarouselState extends State<CardCarousel>
    with AutomaticKeepAliveClientMixin<CardCarousel> {
  late BuildContext dialogContext;
  ProfileRepository profileRepository = ProfileRepository();

  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);

  buildCard(BuildContext context, int index) {
    RecetteThumbnailDTO recipe = widget.recipes[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget? widget) {
        double scale = 1;
        if (pageController.position.haveDimensions) {
          scale = pageController.page! - index;
          scale = (1 - (scale.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return GestureDetector(
          onTap: () => showRecipeDetails(recipe.id),
          child: Center(
            child: SizedBox(
              height: Curves.easeInOut.transform(scale) * 500.0,
              child: widget,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        // width: MediaQuery.of(context).size.width * 0.8,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 0.2), blurRadius: 6.0)
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                image: MemoryImage(base64Decode(recipe.image!)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Text(
                recipe.name,
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 6.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(children: [
                Icon(
                  Icons.star_border_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 6.0),
                Text(
                  recipe.note != null ? recipe.note.toString() : "",
                  style: TextStyle(fontSize: 18.0),
                ),
              ]),
              SizedBox(height: 6.0),
              GestureDetector(
                onTap: () {
                  profileRepository
                      .addRecipeToFavorite(profile!.id!, recipe.id)
                      .then((value) {
                    setState(() {
                      recipe.isFavorite = value;
                    });
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: recipe.isFavorite
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Icon(
                      Icons.favorite_border_sharp,
                      color: recipe.isFavorite
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      size: 20,
                    )),
              )
            ])
          ])
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title.isNotEmpty
            ? Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                ))
            : SizedBox(),
        Container(
          height: 450.0,
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.recipes.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCard(context, index);
            },
          ),
        ),
      ],
    );
  }

  showRecipeDetails(int recipeId) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => CustomDialog(),
    );
    dialogContext = context;
    RecipeApiClient().getOneRecipe(recipeId).then((v) {
      Navigator.pop(dialogContext);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetails(recette: v!),
          ));
    });
  }

  @override
  bool get wantKeepAlive => true;
}
