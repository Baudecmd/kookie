import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';
import 'package:kookie/models/ingredient/IngredientLineDTO.dart';
import 'package:kookie/screens/recipe_steps_creation_screen.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/custom_text_field.dart';
import 'package:kookie/widgets/multiselect_dialog.dart';

import '../datas/data.dart';
import '../models/ingredient/IngredientDTO.dart';

class RecipeCreationScreen extends StatefulWidget {
  @override
  _RecipeCreationScreen createState() => _RecipeCreationScreen();
}

class _RecipeCreationScreen extends State<RecipeCreationScreen> {
  final _recipeFormKey = GlobalKey<FormState>();
  var _ingredients = Set<int>();
  var _categories = Set<int>();
  List<MultiSelectDialogItem> items = [];
  List<MultiSelectDialogItem> categoriesItems = [];
  File? _image;
  Image? _imageWidget;
  String _base64Image = '';
  String _recipeName = '';
  var overlayEntry;

  @override
  void initState() {
    super.initState();
    makeIngredientsMultiSelectItems();
    makeCategoriesMultiSelectItems();
  }

  void makeIngredientsMultiSelectItems() {
    if (listIngredientDTO.isNotEmpty) {
      listIngredientDTO.forEach((e) {
        items.add(MultiSelectDialogItem(listIngredientDTO.indexOf(e), e.name));
      });
    }
  }

  void makeCategoriesMultiSelectItems() {
    if (listCategoryDTO.isNotEmpty) {
      listCategoryDTO.forEach((e) {
        categoriesItems
            .add(MultiSelectDialogItem(listCategoryDTO.indexOf(e), e.name));
      });
    }
  }

  Future<void> selectImage() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      /* encode */
      _image = File(image.path);
      List<int> imageBytes = await _image!.readAsBytes();
      _base64Image = base64Encode(imageBytes);

      /* decode */
      var convertedImage = base64Decode(_base64Image);
      _imageWidget = new Image.memory(convertedImage);
    }
    setState(() {});
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
                            tooltip: 'Choisissez une image',
                            child: Icon(Icons.add_a_photo),
                          ),
                          SizedBox(height: 30),
                          _imageWidget == null
                              ? Center(
                                  child: Text("Aucune image sélectionnée."))
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: _imageWidget),
                          SizedBox(height: 30),
                          CustomButton(
                              text: "Ajouter des ingrédients",
                              onTap: (() => Overlay.of(context)?.insert(
                                  overlayEntry =
                                      _createIngredientsOverlayEntry()))),
                          SizedBox(height: 30),
                          CustomButton(
                            text: "Sélectionner la catégorie",
                            onTap: (() => Overlay.of(context)?.insert(
                                overlayEntry =
                                    _createCategoriesOverlayEntry())),
                          ),
                          SizedBox(height: 30),
                          CustomButton(text: "Valider !", onTap: _submitRecipe),
                          SizedBox(height: 30),
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

  _createIngredientsOverlayEntry() {
    final _recipeIngredientsKey = GlobalKey<FormState>();
    return OverlayEntry(builder: (BuildContext context) {
      return MultiSelectDialog(
          key: _recipeIngredientsKey,
          title: "Select ingredients",
          items: items,
          initialSelectedValues: _ingredients,
          onSubmitData: (recoveredSetData) =>
              _handleRecoveredIngredients(recoveredSetData));
    });
  }

  _createCategoriesOverlayEntry() {
    final _recipeCategoriesKey = GlobalKey<FormState>();
    return OverlayEntry(builder: (BuildContext context) {
      return MultiSelectDialog(
          key: _recipeCategoriesKey,
          title: "Select category",
          items: categoriesItems,
          initialSelectedValues: _categories,
          onSubmitData: (recoveredSetData) =>
              _handleRecoveredCategories(recoveredSetData));
    });
  }

  _handleRecoveredIngredients(Set<int> _recoveredSet) {
    if (_recoveredSet.isNotEmpty) {
      _ingredients = _recoveredSet;
    }
    overlayEntry.remove();
  }

  _handleRecoveredCategories(Set<int> _recoveredSet) {
    if (_recoveredSet.isNotEmpty) {
      _categories = _recoveredSet;
    }
    overlayEntry.remove();
  }

  getIngredientsById(ingredients) {
    List<IngredientDTO> resultList = <IngredientDTO>[];
    ingredients.forEach(
        (ingredient) => {resultList.add(IngredientDTO(name: "Carotte"))});
    return resultList;
  }

  _submitRecipe() {
    if (_ingredients.isEmpty || _base64Image == '' || _recipeName == '') {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Il manque des informations !",
                textAlign: TextAlign.center)));
    } else if (_categories.length != 1) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Vous devez choisir une seule catégorie !",
                textAlign: TextAlign.center)));
    } else {
      _pushStepsScreen();
    }
  }

  List<IngredientLineDTO> convertMultiSelectToIngredientDTO() {
    List<IngredientDTO> _ingredientDTOs =
        _ingredients.map((e) => listIngredientDTO.elementAt(e)).toList();
    List<IngredientLineDTO> _ingredientLines = _ingredientDTOs
        .map((e) => IngredientLineDTO(ingredient: e, quantity: 0))
        .toList();
    return _ingredientLines;
  }

  CategoryDTO getCategoryDTO(int value) {
    var categoryDTO;
    listCategoryDTO.forEach((element) {
      if (element.id == value) {
        categoryDTO = element;
      }
    });
    return categoryDTO;
  }

  _pushStepsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecipesStepsCreationScreen(
            ingredientLines: convertMultiSelectToIngredientDTO(),
            category: getCategoryDTO(_categories.first + 1),
            recipeName: _recipeName,
            base64Image: _base64Image),
      ),
    );
  }
}
