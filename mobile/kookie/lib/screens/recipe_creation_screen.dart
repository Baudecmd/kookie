import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kookie/widgets/custom_text_field.dart';
import 'package:kookie/widgets/multiselect_dialog.dart';

class RecipeCreationScreen extends StatefulWidget {
  @override
  _RecipeCreationScreen createState() => _RecipeCreationScreen();
}

class _RecipeCreationScreen extends State<RecipeCreationScreen> {
  final _recipeFormKey = GlobalKey<FormState>();
  final _recipeSelectIngredientsKey = GlobalKey<FormState>();
  var _image;
  var recipeName;

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
                    _image == null
                        ? Center(child: Text("No image selected."))
                        : Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Image.file(_image)),
                    FloatingActionButton(
                      onPressed: selectImage,
                      tooltip: 'Pick Image',
                      child: Icon(Icons.add_a_photo),
                    ),
                    SizedBox(height: 30),
                    Form(
                      key: _recipeFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              hintText: "Nom de la recette",
                              onChanged: (String value) {
                                recipeName = value;
                                return '';
                              }),
                          MultiSelectDialog(
                              key: _recipeSelectIngredientsKey,
                              title: "Select ingredients",
                              items: items,
                              initialSelectedValues: [].toSet())
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
}
