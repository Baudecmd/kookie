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
      _image = image;
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
          child: Form(
            key: _recipeFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null
                    ? Text("No image selected.")
                    : Image.file(_image),
                FloatingActionButton(
                  onPressed: selectImage,
                  tooltip: 'Pick Image',
                  child: Icon(Icons.add_a_photo),
                ),
                SizedBox(height: 30),
                CustomTextField(
                    hintText: "Nom de la recette",
                    onChanged: (String value) {
                      recipeName = value;
                      return '';
                    }),
                MultiSelectDialog(
                    key: _recipeSelectIngredientsKey,
                    items: items,
                    initialSelectedValues: [].toSet())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
