import 'package:flutter/material.dart';
import 'package:kookie/datas/data.dart';
import 'package:kookie/api/ustensils_api_client.dart';

class MyUstensilsScreen extends StatefulWidget {
  MyUstensilsScreen({Key? key}) : super(key: key);

  @override
  _MyUstensilsScreenState createState() => _MyUstensilsScreenState();
}

/*
*/
class _MyUstensilsScreenState extends State<MyUstensilsScreen> {
  var allUstensils;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.black),
                onPressed: () => Navigator.pop(context)),
            elevation: 0,
            title: Text("Mes ustensiles"),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      var ustensilAPIClient = new UstensilAPIClient();
                      ustensilAPIClient.getAllUstensils().then((value) {
                        allUstensils = value;
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return new SimpleDialog(
                                  title: const Text('Ajouter un ustensil'),
                                  children: value!.map((value2) {
                                    return new SimpleDialogOption(
                                      onPressed: () {
                                        setState(() {
                                          listUstensilDTO.add(value2);
                                        });
                                      },
                                      child: new Text(
                                          value2.name as String), //item value
                                    );
                                  }).toList(),
                                );
                              });
                        });
                      });
                    },
                    child: Icon(
                      Icons.add,
                      size: 26.0,
                    ),
                  ))
            ]),
        body: new ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
            itemCount: listUstensilDTO.length,
            itemBuilder: (BuildContext ctxt, int index) => Container(
                padding: EdgeInsets.all(16.0),
                child: Text(listUstensilDTO[index].name as String,
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)))));
  }
}
