import 'package:flutter/material.dart';
import 'package:kookie/api/recipe_id_client_api.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/models/step/StepDTO.dart';
import 'package:kookie/models/step/StepTypeDTO.dart';

class RecipeDetails extends StatefulWidget {
  final int? recipeId;

  const RecipeDetails({Key? key, required this.recipeId}) : super(key: key);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  var recette;
  List<Widget> _widgetOptions = [
    Text("Oki"),
    Text("Ustensils"),
    Text("Étapes")
  ];

  @override
  initState() {
    super.initState();
    RecipeClient().recetteFromID(widget.recipeId).then((value) => setState(() {
          recette = value;
          var steptype = StepTypeDTO(name: "Cuisson");
          _widgetOptions = initTab();
        }));
  }

/*ListView.builder(
          itemCount: ustensils.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new Text(ustensils[index].name);
          })*/
  List<Widget> initTab() {
    //var ustensils = recette.getAllUstensils();
    return <Widget>[
      ListView.builder(
          itemCount: recette.ingredientLines!.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new Text(recette.ingredientLines[index].ingredient.name);
          }),
      Text("Ustensils"),
      ListView.builder(
          itemCount: recette.steps!.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new Text(recette.steps[index].name);
          })
    ];
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.chevron_left, color: Colors.black),
              onPressed: () => Navigator.pop(context)),
          elevation: 0,
          title: Text("Détails recette"),
        ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              padding: EdgeInsets.only(top: 30.0),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.radiofrance.fr/s3/cruiser-production/2019/02/3e27345f-9e1e-45bb-9e5f-906f0abb2870/1200x680_gettyimages-922684138.jpg"),
                    fit: BoxFit.fill),
              )),
          Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(recette.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          Container(
            height: MediaQuery.of(context).size.height - 110,
            padding: EdgeInsets.only(top: 20.0),
            child: _widgetOptions.elementAt(_selectedIndex),
          )
        ])),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_rounded),
              label: 'Ingrédients',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Ustensiles',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alt_route_sharp),
              label: 'Étapes',
            ),
          ],
          selectedItemColor: Colors.amber[800],
        ));
  }
}
