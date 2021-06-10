import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/api/recipe_api_client.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/ingredient/IngredientLineDTO.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/models/step/StepDTO.dart';
import 'package:kookie/screens/step_creation_screen.dart';
import 'package:kookie/widgets/custom_button.dart';

class RecipesStepsCreationScreen extends StatefulWidget {
  final List<IngredientLineDTO> ingredientLines;
  final String recipeName;
  final String base64Image;

  RecipesStepsCreationScreen(
      {required this.ingredientLines,
      required this.recipeName,
      required this.base64Image});

  @override
  _RecipeStepsCreationScreen createState() => _RecipeStepsCreationScreen();
}

class _RecipeStepsCreationScreen extends State<RecipesStepsCreationScreen> {
  final List<int> _items = List<int>.generate(1, (int index) => index);
  List<StepDTO> _steps = [];

  RecipeApiClient recipeApiClient = RecipeApiClient();

  @override
  void initState() {
    super.initState();
    _steps.add(StepDTO(stepNumber: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_items[index].toString()),
                    onDismissed: (direction) =>
                        {_items.removeAt(index), _refreshListView()},
                    child: Card(
                      key: ValueKey(index),
                      margin: const EdgeInsets.all(10),
                      color: Color.fromRGBO(205, 205, 205, 1),
                      child: ListTile(
                        title: Text('Étape ${_items[index]}'),
                        trailing: Icon(Icons.drag_handle_outlined),
                        onTap: () => _openTileInfo(index),
                      ),
                    ),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final int item = _items.removeAt(oldIndex);
                    _items.insert(newIndex, item);
                  });
                },
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(text: "Ajouter une étape", onTap: _addStep),
                CustomButton(text: "Valider la recette !", onTap: _submitInfo)
              ],
            )
          ],
        ),
      ),
    );
  }

  _refreshListView() {
    setState(() {});
  }

  _addStep() {
    var stepNumber = 1;
    var isInList = true;
    while (isInList) {
      if (_items.contains(stepNumber)) {
        stepNumber++;
      } else {
        isInList = false;
      }
    }
    setState(() {
      _items.insert(_items.length, stepNumber);
    });
    _steps.insert(stepNumber - 1, StepDTO(stepNumber: stepNumber));
  }

  _openTileInfo(index) async {
    debugPrint(_steps[index].stepNumber.toString());
    StepDTO result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => StepCreationScreen(_steps[index]),
          fullscreenDialog: true),
    );
    if (result != null) {
      StepDTO? step;
      _steps.forEach((element) {
        if (element.stepNumber == result.stepNumber) step = element;
      });
      if (step != null) _steps[index] = result;
    }
  }

  _submitInfo() {
    //List<IngredientDTO> listIngredientDTO;
    //widget.ingredients.forEach((element) {listIngredientDTO.add(new )})

    //RecetteDTO recetteDTO = RecetteDTO(name: widget.recipeName, category: widget., imageURL: widget.base64Image, ingredientLines: widget.ingredients, opinions: , profile: , stepLines: );
    int stepIndex = 1;
    _steps.forEach((element) {
      element.stepNumber = stepIndex;
      stepIndex++;
    });
    recipeApiClient.createRecipe(RecetteDTO(
        profile: profile,
        name: widget.recipeName,
        image: widget.base64Image,
        category: CategoryDTO(id: 10, name: "Français"),
        ingredientLines: widget.ingredientLines,
        steps: _steps));

    /*Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);*/
  }
}
