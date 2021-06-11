import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';
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
  List<MultiSelectDialogItem> items = [];
  Map<int, UstensilDTO> _ustensils = {};

  @override
  void initState() {
    super.initState();
    StepDTO _step = widget.step;
    this._controller = new TextEditingController(text: _step.name);
    makeMultiSelectItems();
  }

  void makeMultiSelectItems() {
    if (listUstensilDTO.isNotEmpty) {
      listUstensilDTO.forEach((e) {
        items.add(MultiSelectDialogItem(e.id!, e.name!));
      });
    }
  }

  final textKey = GlobalKey<FormState>();
  final utensilsListKey = GlobalKey<FormState>();
  String? _stepName;
  late final TextEditingController _controller;

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
                  maxLines: null,
                  controller: _controller,
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
              ...items.map((item) {
                return CheckboxListTile(
                    value: _ustensils.keys.contains(item.value),
                    title: Text(item.label),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (checked) {
                      _onUtensilCheckedChange(item.value, checked!);
                    });
              }).toList(),
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

  _onUtensilCheckedChange(int value, bool checked) {
    setState(() {
      if (checked) {
        for (UstensilDTO u in listUstensilDTO) {
          if (u.id == value) {
            _ustensils[value] = u;
          }
        }
      } else {
        for (UstensilDTO u in listUstensilDTO) {
          if (u.id == value) {
            _ustensils.remove(value);
          }
        }
      }
    });
  }

  List<UstensilDTO> convertMultiSelectToIngredientDTO() {
    return items.map((e) => listUstensilDTO.elementAt(e.value)).toList();
  }

  _submitStepData() {
    var step = StepDTO(
        name: _stepName,
        stepNumber: widget.step.stepNumber,
        ustensils: _ustensils.values.toList(),
        stepType: StepTypeDTO(id: 1, name: "Préparation"));
    debugPrint(step.id.toString() +
        " " +
        step.name.toString() +
        " " +
        step.stepNumber.toString() +
        " " +
        step.ustensils.toString());
    Navigator.pop(context, step);
  }
}
