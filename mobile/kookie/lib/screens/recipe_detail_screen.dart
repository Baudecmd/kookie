import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';
import 'package:kookie/models/step/StepTypeDTO.dart';

class RecipeDetails extends StatefulWidget {
  final RecetteDTO recette;

  const RecipeDetails({Key? key, required this.recette}) : super(key: key);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  List<Widget> _widgetOptions = [
    Text("Oki"),
    Text("Ustensils"),
    Text("Étapes")
  ];

  @override
  initState() {
    super.initState();
    var steptype = StepTypeDTO(name: "Cuisson");
    _widgetOptions = initTab();
  }

  List<Widget> initTab() {
    var ustensils = widget.recette.getAllUstensils();
    return <Widget>[
      ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 0.5),
          itemCount: widget.recette.ingredientLines!.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  widget.recette.ingredientLines![index].ingredient.name,
                  style: TextStyle(fontSize: 20),
                ));
          }),
      ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 0.5),
          itemCount: ustensils.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  ustensils[index].name!,
                  style: TextStyle(fontSize: 20),
                ));
          }),
      ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 0.5),
          itemCount: widget.recette.steps!.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new Container(
                padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Card(
                  child: ListTile(
                      title: Text("Étape " + (index + 1).toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      subtitle: Text(
                        widget.recette.steps![index].name!,
                        style: TextStyle(fontSize: 13),
                      )),
                ));
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
                    image: MemoryImage(base64Decode(widget.recette.image!)),
                    fit: BoxFit.fill),
              )),
          Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(widget.recette.name,
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
