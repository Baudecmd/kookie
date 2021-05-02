import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/screens/home_screen.dart';
import 'package:kookie/screens/step_creation_screen.dart';
import 'package:kookie/widgets/custom_button.dart';

class RecipesStepsCreationScreen extends StatefulWidget {
  @override
  _RecipeStepsCreationScreen createState() => _RecipeStepsCreationScreen();
}

class _RecipeStepsCreationScreen extends State<RecipesStepsCreationScreen> {
  final List<int> _items = List<int>.generate(1, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_items[index].toString()),
                    onDismissed: (direction) =>
                        {_items.removeAt(index), _refreshListView()},
                    child: Card(
                      key: ValueKey(index),
                      margin: const EdgeInsets.all(10),
                      color: Color.fromRGBO(205, 205, 205, 1),
                      child: ListTile(
                        title: Text('Étape ${_items[index]}'),
                        trailing: Icon(Icons.drag_handle_outlined),
                        onTap: _openTileInfo,
                      ),
                    ),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final int item = _items.removeAt(oldIndex);
                    _items.insert(newIndex, item);
                  });
                },
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(text: "Ajouter une étape", onTap: _addStep),
                CustomButton(text: "Valider la recette !", onTap: _submitInfo)
              ],
            )
          ],
        ),
      ),
    );
  }

  _openTileInfo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => StepCreationScreen()));
  }

  _refreshListView() {
    setState(() {});
  }

  _addStep() {
    setState(() {
      _items.insert(_items.length, _items.length);
    });
  }

  _submitInfo() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }
}
