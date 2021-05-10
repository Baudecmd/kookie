import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/widgets/custom_button.dart';

class MultiSelectItem {
  const MultiSelectItem(this.value, this.label);

  final int value;
  final String label;
}

class StepCreationScreen extends StatefulWidget {
  late final List<MultiSelectItem> _utensilsList;

  StepCreationScreen() {
    _utensilsList = _getUtensilsList();
  }

  @override
  _StepCreationScreen createState() => _StepCreationScreen();

  _getUtensilsList() {
    return [
      MultiSelectItem(1, "Couteaux de cuisine"),
      MultiSelectItem(2, "Four"),
      MultiSelectItem(3, "Épluche-légumes")
    ];
  }
}

class _StepCreationScreen extends State<StepCreationScreen> {
  final textKey = GlobalKey<FormState>();
  final utensilsListKey = GlobalKey<FormState>();
  final _selectedUtensils = Set<int>();

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
                  keyboardType: TextInputType.multiline,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                    "Quels sont le matériel et les ustensiles requis pour cette étape ?"),
              ),
              SizedBox(height: 20),
              ...widget._utensilsList.map((item) {
                return CheckboxListTile(
                  value: _selectedUtensils.contains(item.value),
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
        _selectedUtensils.add(value);
      } else {
        _selectedUtensils.remove(value);
      }
    });
  }

  _submitStepData() {
    Navigator.pop(context, _selectedUtensils);
  }
}
