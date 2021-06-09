import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';
import 'package:kookie/models/step/StepDTO.dart';
import 'package:kookie/screens/home_screen.dart';
import 'package:kookie/screens/step_creation_screen.dart';
import 'package:kookie/widgets/custom_button.dart';

class RecipesStepsCreationScreen extends StatefulWidget {
  final List<IngredientDTO> ingredients;
  final String recipeName;
  final String base64Image;

  RecipesStepsCreationScreen(
      {required this.ingredients,
      required this.recipeName,
      required this.base64Image});

  @override
  _RecipeStepsCreationScreen createState() => _RecipeStepsCreationScreen();
}

class _RecipeStepsCreationScreen extends State<RecipesStepsCreationScreen> {
  List<StepDTO> _steps = [];

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
                    key: UniqueKey(),
                    onDismissed: (direction) =>
                        {_steps.removeAt(index), _refreshListView()},
                    child: Card(
                      key: ValueKey(index),
                      margin: const EdgeInsets.all(10),
                      color: Color.fromRGBO(205, 205, 205, 1),
                      child: ListTile(
                        title: Text('Étape ${_steps[index].stepNumber}'),
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
                    final StepDTO item = _steps.removeAt(oldIndex);
                    _steps.insert(newIndex, item);
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
    var stepNumber = 0;
    var isInList = true;
    while (isInList) {
      if (_isAvailableStepNumber(stepNumber)) {
        isInList = false;
      } else {
        stepNumber++;
      }
    }
    setState(() {
      _steps.add(StepDTO(stepNumber: stepNumber));
    });
  }

  bool _isAvailableStepNumber(int stepNumber) {
    bool isAvailable = true;
    _steps.forEach((element) {
      if (element.stepNumber == stepNumber) isAvailable = false;
    });
    return isAvailable;
  }

  _openTileInfo(int index) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => StepCreationScreen(_steps.elementAt(index)),
          fullscreenDialog: true),
    );
    if (result != null) {
      _steps.insert(index, result);
    }
  }

  _submitInfo() {
    //List<IngredientDTO> listIngredientDTO;
    //widget.ingredients.forEach((element) {listIngredientDTO.add(new )})

    //RecetteDTO recetteDTO = RecetteDTO(name: widget.recipeName, category: widget., imageURL: widget.base64Image, ingredientLines: widget.ingredients, opinions: , profile: , stepLines: );

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }
}
