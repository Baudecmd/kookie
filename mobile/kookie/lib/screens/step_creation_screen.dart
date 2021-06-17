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
  late List<UstensilDTO> _ustensils;
  final textKey = GlobalKey<FormState>();
  final utensilsListKey = GlobalKey<FormState>();
  late String? _stepName;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _stepName = widget.step.name;
    this._controller = new TextEditingController(text: widget.step.name);
    _ustensils = widget.step.ustensils!.toList();
    makeMultiSelectItems();
  }

  void makeMultiSelectItems() {
    if (listUstensilDTO.isNotEmpty) {
      listUstensilDTO.forEach((e) {
        items.add(MultiSelectDialogItem(e.id!, e.name!));
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
                  controller: _controller,
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
              ...items.map((item) {
                return CheckboxListTile(
                    value: isInUtensilsList(item),
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
    return items.map((e) => listUstensilDTO.elementAt(e.value)).toList();
  }

  _submitStepData() {
    var step = StepDTO(
        name: _stepName,
        stepNumber: widget.step.stepNumber,
        ustensils: _ustensils,
        stepType: StepTypeDTO(id: 1, name: "Préparation"));
    Navigator.pop(context, step);
  }
}
