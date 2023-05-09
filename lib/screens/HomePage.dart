import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/elementsData_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _elements = [];

  Future readJson() async {
    final String response = await rootBundle.loadString("assets/data/elementsData.json");
    final data =json.decode(response);
    setState(() {
      _elements = data["elements"];
      print("axsxs ${_elements.length}");
      //print(response)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Afdsddsa"),
      ),
      body:Column(
        children: [
          _elements.isNotEmpty ? Expanded(
            child: ListView.builder(
              itemCount: _elements.length,
              itemBuilder: (context, index) {
                print(_elements[index]);
                return Card(
                  //key: ValueKey(_elements[index]["number"]),
                  margin: EdgeInsets.all(10),
                  //color: Color(_elements[index]["colors"]),
                  child: ListTile(
                    leading: Text(_elements[index]["name"]),
                    title: Text(_elements[index]["symbol"]),
                    subtitle: Text(_elements[index]["category"]),
                  ),
                );
              },
            ),
          ) : ElevatedButton(
            onPressed: (){
              readJson();
            },
            child: Center(child: Text("adadsds"),),
          )
        ],
      )
    );
  }
}


// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import '../models/elementsData_model.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   Future<List<ElementsData>> getElementsData() async {
//     String data = await DefaultAssetBundle.of(context).loadString("assets/data/elementsData.json");
//     List<dynamic> mapData = jsonDecode(data);
//     print(mapData);
//     List<ElementsData> elementsData = mapData.map((elementData) => ElementsData.fromJson(elementData)).toList();
//     return elementsData;
//   }
//
//   @override
//   void initState() {
//     getElementsData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

