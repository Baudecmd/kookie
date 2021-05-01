import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kookie/screens/step_creation_screen.dart';
import 'package:kookie/widgets/custom_button.dart';

class RecipesStepsCreationScreen extends StatefulWidget {
  @override
  _RecipeStepsCreationScreen createState() => _RecipeStepsCreationScreen();
}

class _RecipeStepsCreationScreen extends State<RecipesStepsCreationScreen> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: ReorderableListView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                children: <Widget>[
                  for (int index = 0; index < _items.length; index++)
                    ListTile(
                      contentPadding: EdgeInsets.all(10),
                      key: Key('$index'),
                      tileColor:
                          _items[index].isOdd ? oddItemColor : evenItemColor,
                      title: Text('Etape ${_items[index]}'),
                      onTap: _openTileInfo,
                      trailing: Icon(Icons.drag_handle_outlined),
                    ),
                ],
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
            CustomButton(text: "Valider la recette !", onTap: _submitInfo)
          ],
        ),
      ),
    );
  }

  _openTileInfo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => StepCreationScreen()));
  }

  _submitInfo() {
    debugPrint("Pouet");
  }
}
