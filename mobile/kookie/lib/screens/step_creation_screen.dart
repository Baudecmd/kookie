import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';
import 'package:kookie/models/ingredient/IngredientLineDTO.dart';
import 'package:kookie/models/step/StepDTO.dart';
import 'package:kookie/models/step/StepTypeDTO.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/multiselect_dialog.dart';

class StepCreationScreen extends StatefulWidget {
  final StepDTO step;

  StepCreationScreen(this.step);

  @override
  _StepCreationScreen createState() => _StepCreationScreen();
}

class _StepCreationScreen extends State<StepCreationScreen> {
  List<MultiSelectDialogItem> ingredientsItems = [];
  List<MultiSelectDialogItem> utensilsItems = [];
  List<MultiSelectDialogItem> stepTypesItems = [];
  var _ingredients = Set<int>();
  var _stepTypes = Set<int>();
  late List<UstensilDTO> _ustensils;
  final textKey = GlobalKey<FormState>();
  final utensilsListKey = GlobalKey<FormState>();
  late String? _stepName;
  int _ingredientQuantity = 0;
  late final TextEditingController _descriptionController;
  late final TextEditingController _quantityController;
  var overlayEntry;

  @override
  void initState() {
    super.initState();
    _stepName = widget.step.name;
    this._descriptionController =
        new TextEditingController(text: widget.step.name);
    this._quantityController = new TextEditingController(
        text: widget.step.ingredientLine!.quantity.toString());
    _ustensils = widget.step.ustensils!.toList();
    _ingredients = _initIngredients();
    _stepTypes = _initStepTypes();
    _ingredientQuantity = widget.step.ingredientLine!.quantity;
    makeIngredientsMultiSelectItems();
    makeUtensilsMultiSelectItems();
    makeStepTypesMultiSelectItems();
  }

  void makeIngredientsMultiSelectItems() {
    if (listIngredientDTO.isNotEmpty) {
      listIngredientDTO.forEach((e) {
        ingredientsItems
            .add(MultiSelectDialogItem(listIngredientDTO.indexOf(e), e.name));
      });
    }
  }

  void makeUtensilsMultiSelectItems() {
    if (listUstensilDTO.isNotEmpty) {
      listUstensilDTO.forEach((e) {
        utensilsItems.add(MultiSelectDialogItem(e.id!, e.name!));
      });
    }
  }

  void makeStepTypesMultiSelectItems() {
    if (listStepTypeDTO.isNotEmpty) {
      listStepTypeDTO.forEach((e) {
        stepTypesItems.add(MultiSelectDialogItem(e.id!, e.name));
      });
    }
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
          child: ListView(
            children: [
              SizedBox(height: 50),
              Center(
                child: Text("Décrivez cette étape !"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  key: textKey,
                  controller: _descriptionController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (String value) {
                    _stepName = value;
                  },
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                    "Quels sont le matériel et les ustensiles requis pour cette étape ?"),
              ),
              SizedBox(height: 20),
              ...utensilsItems.map((item) {
                return CheckboxListTile(
                    value: isInUtensilsList(item),
                    title: Text(item.label),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (checked) {
                      _onUtensilCheckedChange(item.value, checked!);
                    });
              }).toList(),
              SizedBox(height: 20),
              CustomButton(
                text: "Quel ingrédient ?",
                onTap: (() => Overlay.of(context)
                    ?.insert(overlayEntry = _createIngredientsOverlayEntry())),
              ),
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(
                      labelText: "Quelle quantité ? (En grammes)"),
                  keyboardType: TextInputType.number,
                  controller: _quantityController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (String value) {
                    _ingredientQuantity = int.parse(value);
                  }),
              SizedBox(height: 20),
              CustomButton(
                text: "Quel est le type d'étape ?",
                onTap: (() => Overlay.of(context)
                    ?.insert(overlayEntry = _createStepTypesOverlayEntry())),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: CustomButton(
                    text: "Valider",
                    onTap: _submitStepData,
                  ),
                ),
              ),
              SizedBox(height: 20),
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
          title: "Sélectionnez l'ingrédient",
          items: ingredientsItems,
          initialSelectedValues: _ingredients,
          onSubmitData: (recoveredSetData) =>
              _handleRecoveredIngredients(recoveredSetData));
    });
  }

  _createStepTypesOverlayEntry() {
    final _recipeStepTypeKey = GlobalKey<FormState>();
    return OverlayEntry(builder: (BuildContext context) {
      return MultiSelectDialog(
          key: _recipeStepTypeKey,
          title: "Sélectionnez le type d'étape",
          items: stepTypesItems,
          initialSelectedValues: _stepTypes,
          onSubmitData: (recoveredSetData) =>
              _handleRecoveredStepTypes(recoveredSetData));
    });
  }

  _handleRecoveredIngredients(Set<int> _recoveredSet) {
    if (_recoveredSet.isNotEmpty) {
      _ingredients = _recoveredSet;
    }
    overlayEntry.remove();
  }

  _handleRecoveredStepTypes(Set<int> _recoveredSet) {
    if (_recoveredSet.isNotEmpty) {
      _stepTypes = _recoveredSet;
    }
    overlayEntry.remove();
  }

  _onUtensilCheckedChange(int value, bool checked) {
    setState(() {
      if (checked) {
        for (UstensilDTO u in listUstensilDTO) {
          if (u.id == value) {
            _ustensils.add(u);
          }
        }
      } else {
        _ustensils.removeWhere((element) => element.id == value);
      }
    });
  }

  bool isInUtensilsList(item) {
    bool result = false;
    _ustensils.forEach((element) {
      if (element.id == item.value && element.name == item.label) {
        result = true;
      }
    });
    return result;
  }

  List<UstensilDTO> convertMultiSelectToIngredientDTO() {
    return utensilsItems
        .map((e) => listUstensilDTO.elementAt(e.value))
        .toList();
  }

  _initIngredients() {
    var set = Set<int>();
    var selectedIngredient = widget.step.ingredientLine!.ingredient.id;
    if (selectedIngredient != null) {
      set.add(selectedIngredient - 1);
    }
    return set;
  }

  _initStepTypes() {
    var set = Set<int>();
    var selectedStepType = widget.step.stepType!.id;
    if (selectedStepType != null) {
      set.add(selectedStepType);
    }
    return set;
  }

  IngredientLineDTO getIngredientLineDTO(int value) {
    var ingredientLineDTO;
    listIngredientDTO.forEach((element) {
      if (element.id == value) {
        ingredientLineDTO = IngredientLineDTO(
            ingredient: element, quantity: _ingredientQuantity);
      }
    });
    return ingredientLineDTO;
  }

  StepTypeDTO getStepTypeDTO(int value) {
    var stepTypeDTO;
    listStepTypeDTO.forEach((element) {
      if (element.id == value) {
        stepTypeDTO = element;
      }
    });
    return stepTypeDTO;
  }

  _submitStepData() {
    if (_stepName == "" || _ustensils.isEmpty) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Il manque des informations !",
                textAlign: TextAlign.center)));
    } else if (_ingredients.length != 1) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Vous devez choisir un seul ingrédient !",
                textAlign: TextAlign.center)));
    } else if (_stepTypes.length != 1) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Vous devez choisir un seul type d'étape !",
                textAlign: TextAlign.center)));
    } else {
      _popStep();
    }
  }

  _popStep() {
    var step = StepDTO(
        name: _stepName,
        stepNumber: widget.step.stepNumber,
        ingredientLine: getIngredientLineDTO(_ingredients.first + 1),
        ustensils: _ustensils,
        stepType: getStepTypeDTO(_stepTypes.first));
    Navigator.pop(context, step);
  }
}
