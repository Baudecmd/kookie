import 'package:flutter_test/flutter_test.dart';
import 'package:kookie/api/recipe_api_client.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';

void main() {
  test('Unit Testing : API get list of ingredients', () async {
    final List<IngredientDTO> listIngredientDTO =
        await RecipeApiClient().getIngredients() ?? [];
    expect(listIngredientDTO.isNotEmpty, true);
  });

  test('Unit Testing : API get list of ustensils', () async {
    final List<UstensilDTO> listUstensilDTO =
        await RecipeApiClient().getAllUstensils() ?? [];
    expect(listUstensilDTO.isNotEmpty, true);
  });

  /*testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    List<MultiSelectDialogItem> items = [];
    Key key = GlobalKey();
    Set<int> initialSelectedValues = Set<int>();
    await tester.pumpWidget(MultiSelectDialog(
        key: key,
        title: 'test',
        items: items,
        initialSelectedValues: initialSelectedValues,
        onSubmitData: () {}));
    final titleFinder = find.text('test');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });*/
}
