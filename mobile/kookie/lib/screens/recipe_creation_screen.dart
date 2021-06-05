import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';
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
  File? _image;
  Image? _imageWidget;
  late String _base64Image;
  late String _recipeName;
  var overlayEntry;

  @override
  void initState() {
    debugPrint(listIngredientDTO.toString());
    /*List<IngredientDTO> listIngredientDTO = [];
    RecipeApiClient().getIngredients().then((v) => setState(() {
          listIngredientDTO = v!;
          print(listIngredientDTO[1].name);
        }));*/
  }

  final items = <MultiSelectDialogItem>[
    MultiSelectDialogItem(1, "Pomme de terre"),
    MultiSelectDialogItem(2, "Saucisse"),
    MultiSelectDialogItem(3, "Carotte"),
  ];

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
                            tooltip: 'Pick Image',
                            child: Icon(Icons.add_a_photo),
                          ),
                          SizedBox(height: 30),
                          _imageWidget == null
                              ? Center(child: Text("No image selected."))
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: _imageWidget),
                          SizedBox(height: 30),
                          CustomButton(
                              text: "Ajouter des ingrédients",
                              onTap: (() => Overlay.of(context)?.insert(
                                  overlayEntry = _createOverlayEntry()))),
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

  _createOverlayEntry() {
    final _recipeIngredientsKey = GlobalKey<FormState>();
    return OverlayEntry(builder: (BuildContext context) {
      return MultiSelectDialog(
          key: _recipeIngredientsKey,
          title: "Select ingredients",
          items: items,
          initialSelectedValues: _ingredients,
          onSubmitData: (recoveredSetData) =>
              _handleRecoveredSetData(recoveredSetData));
    });
  }

  _handleRecoveredSetData(Set<int> _recoveredSet) {
    if (_recoveredSet.isNotEmpty) {
      _ingredients = _recoveredSet;
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
    if (_ingredients.isEmpty || _recipeName == null || _base64Image == null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Il manque des informations !",
                textAlign: TextAlign.center)));
    } else {
      debugPrint(
          "[_submitRecipe] : $_recipeName | $_ingredients | _base64Image is not null");
      _pushStepsScreen();
    }
  }

  _pushStepsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecipesStepsCreationScreen(
            ingredients: _ingredients,
            recipeName: _recipeName,
            base64Image: _base64Image),
      ),
    );
  }
}
