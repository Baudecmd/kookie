import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';
import 'package:kookie/widgets/multiselect_dialog.dart';

class RecipeCreationScreen extends StatefulWidget {
  @override
  _RecipeCreationScreen createState() => _RecipeCreationScreen();
}

class _RecipeCreationScreen extends State<RecipeCreationScreen> {
  final _recipeFormKey = GlobalKey<FormState>();
  var _ingredients = Set<int>();
  var _image;
  var _recipeName;

  final items = <MultiSelectDialogItem<int>>[
    MultiSelectDialogItem(1, "Pomme de terre"),
    MultiSelectDialogItem(2, "Saucisse"),
    MultiSelectDialogItem(3, "Carotte"),
  ];

  Future<void> selectImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/login_page_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Form(
                      key: _recipeFormKey,
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          CustomTextField(
                              hintText: "Nom de la recette",
                              onChanged: (String value) {
                                _recipeName = value;
                                return '';
                              }),
                          SizedBox(height: 30),
                          FloatingActionButton(
                            onPressed: selectImage,
                            tooltip: 'Pick Image',
                            child: Icon(Icons.add_a_photo),
                          ),
                          SizedBox(height: 30),
                          _image == null
                              ? Center(child: Text("No image selected."))
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Image.file(_image)),
                          SizedBox(height: 30),
                          CustomButton(
                              text: "Ajouter des ingrédients",
                              onTap: _testOnAlertTap),
                          SizedBox(height: 30),
                          CustomButton(text: "Valider !", onTap: _submitRecipe)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _testOnAlertTap() async {
    final _recipeSelectIngredientsKey = GlobalKey<FormState>();
    _ingredients = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiSelectDialog(
                key: _recipeSelectIngredientsKey,
                title: "Select ingredients",
                items: items,
                initialSelectedValues: _ingredients)));
  }

  getIngredientsById(ingredients) {
    List<IngredientDTO> resultList = <IngredientDTO>[];
    ingredients.forEach(
        (ingredient) => {resultList.add(IngredientDTO(name: "Carotte"))});
    return resultList;
  }

  _submitRecipe() {
    if (_ingredients.isEmpty || _recipeName == null || _image == null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Il manque des informations !",
                textAlign: TextAlign.center)));
    } else {
      var tempIngredients = getIngredientsById(_ingredients);
      /*RecetteDTO recette = RecetteDTO(
          name: _recipeName,
          ingredientLinesDTO: tempIngredients);*/
    }
  }
}
