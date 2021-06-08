import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/widgets/custom_button.dart';
import 'package:kookie/widgets/multiselect_dialog.dart';

class StepInfo {
  StepInfo(this.description, this.utensilsSet);

  String description;
  Set<int> utensilsSet;
}

class StepCreationScreen extends StatefulWidget {
  late final stepInfo;

  StepCreationScreen(StepInfo stepInfo) {
    this.stepInfo = stepInfo;
  }

  @override
  _StepCreationScreen createState() => _StepCreationScreen(stepInfo);

}

class _StepCreationScreen extends State<StepCreationScreen> {
  List<MultiSelectDialogItem> items = [];

  _StepCreationScreen(StepInfo stepInfo) {
    this._stepInfo = stepInfo;
    this._controller = new TextEditingController(text: stepInfo.description);
  }

  @override
  void initState() {
    super.initState();
  }

  void makeMultiSelectItems() {
    if (listUstensilDTO.isNotEmpty) {
      listUstensilDTO.forEach((e) {
        items.add(MultiSelectDialogItem(listUstensilDTO.indexOf(e), e.name!));
      });
    }
  }

  final textKey = GlobalKey<FormState>();
  final utensilsListKey = GlobalKey<FormState>();
  late final StepInfo _stepInfo;
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
                    _stepInfo.description = value;
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
                  value: _stepInfo.utensilsSet.contains(item.value),
                  title: Text(item.label),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (checked) =>
                      _onUtensilCheckedChange(item.value, checked!),
                );
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
        _stepInfo.utensilsSet.add(value);
      } else {
        _stepInfo.utensilsSet.remove(value);
      }
    });
  }

  _submitStepData() {
    var stepInfo = _stepInfo;
    Navigator.pop(context, stepInfo);
  }
}
