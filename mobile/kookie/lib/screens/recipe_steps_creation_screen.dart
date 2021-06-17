import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/api/recipe_api_client.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/ingredient/IngredientLineDTO.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/models/step/StepDTO.dart';
import 'package:kookie/screens/home_screen.dart';
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
  List<StepDTO> _steps = [];

  RecipeApiClient recipeApiClient = RecipeApiClient();

  @override
  void initState() {
    super.initState();
    _steps.add(StepDTO(stepNumber: 1, ustensils: List<UstensilDTO>.empty()));
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
                itemCount: _steps.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_steps[index].stepNumber.toString()),
                    onDismissed: (direction) =>
                        {_steps.removeAt(index), _refreshListView()},
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: Color.fromRGBO(205, 205, 205, 1),
                      child: ListTile(
                        title: Text(
                            'Étape ${_steps[index].stepNumber.toString()}'),
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
                    final StepDTO step = _steps.removeAt(oldIndex);
                    _steps.insert(newIndex, step);
                    _updateStepsNumbers();
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

  _updateStepsNumbers() {
    var newStepNumber = 1;
    _steps.forEach((element) {
      element.stepNumber = newStepNumber;
      newStepNumber++;
    });
  }

  _addStep() {
    var stepNumber = 1;
    var isInList = true;
    while (isInList) {
      if (_isInStepsList(stepNumber)) {
        stepNumber++;
      } else {
        isInList = false;
      }
    }
    setState(() {
      _steps.insert(
          stepNumber - 1,
          StepDTO(
              stepNumber: stepNumber, ustensils: List<UstensilDTO>.empty()));
    });
  }

  bool _isInStepsList(stepNumber) {
    bool result = false;
    _steps.forEach((element) {
      if (element.stepNumber == stepNumber) {
        result = true;
      }
    });
    return result;
  }

  _openTileInfo(index) async {
    StepDTO result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => StepCreationScreen(_steps[index]),
          fullscreenDialog: true),
    );
    _steps[index] = result;
  }

  _submitInfo() {
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

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }
}
