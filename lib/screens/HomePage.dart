import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../models/elementsData_model.dart';
import 'Details.dart';
import 'ElementTitle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // final gridList = rootBundle.loadString("assets/data/elementsData.json")
  //     .then((source) => jsonDecode(source)["elements"] as List)
  //     .then((list) => list.map((json) => json != null ? ElementsData.fromJson(json) : null).toList());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List _elements = [];

  Future readJson() async {
    final response = await rootBundle.loadString("assets/data/elementsData.json");
    final data =json.decode(response);
    setState(() {
      _elements = data["elements"];
      print("axsxs ${_elements.length}");
      //print(response)
    });
  }
@override
  void initState() {
  readJson();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF082032),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black12,
        title: const Text("Periodic Table", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body:
      // body: FutureBuilder<List<dynamic>>(
      //   initialData: [],
      //   future: widget.gridList,
      //   builder: (_, AsyncSnapshot<List<dynamic>> snapshot) => snapshot.hasData
      //       ? _buildTable(snapshot.data)
      //       : const  Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),


      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 800,
          height: 1000,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9,crossAxisSpacing: 3,mainAxisSpacing: 3),
            scrollDirection: Axis.vertical,
            itemCount: _elements.length,
            //scrollDirection: Axis.horizontal,
            // physics: const BouncingScrollPhysics(),
            // semanticChildCount: 10,
            itemBuilder: (context,index) {
              return GestureDetector(
                onTap:(){
                  Navigator.push(context, PageRouteBuilder(

                            transitionDuration: const Duration(milliseconds: 400),
                            transitionsBuilder: (BuildContext context, Animation<double>_anim,
                                Animation<double>_anim2,Widget child){
                              _anim= CurvedAnimation(parent: _anim, curve: Curves.fastOutSlowIn);
                              return ScaleTransition(scale: _anim,
                                child: child,);
                            },

                            pageBuilder: (BuildContext context, Animation<double>_anim,
                                Animation<double>_anim2) {
                              return  Details(index);
                            },
                        ));
                //  Get.to(context,arguments: Details(index),transition: Transition.fade,duration: const Duration(seconds: 2));
                  // Navigator.push(context,MaterialPageRoute(
                  //
                  //     builder: (context){
                  //   return Details(index);
                  // }));
                },
                child:  Hero(
                tag: "$index",
                  child: Card(
                  //key: ValueKey(_elements[index]["number"]),

                  //color: Colors.blueGrey,
                    //color: const Color(0xFF082032),
                    //color: Colors.black38,
                    color: _elements[index]["category"] == "Alkali Metal"
                        ? Colors.redAccent
                        : _elements[index]["category"] == "Reactive Nonmetal"
                        ? Colors.blue
                        : _elements[index]["category"] == "Alkaline Earth Metal"
                        ? Colors.green
                        : _elements[index]["category"] == "Transition Metal"
                        ? Colors.yellow[700]
                        : _elements[index]["category"] == "Lanthanide"
                        ? Colors.deepOrange
                        : _elements[index]["category"] == "Actinide"
                        ? Colors.pink
                        : _elements[index]["category"] == "Post-transition Metal"
                        ? Colors.purple
                        : Colors.grey,



                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(padding: const EdgeInsets.only(top: 5, left: 3,), child: Text(""+_elements[index]["number"].toString(),style: TextStyle(fontSize:Theme.of(context).textTheme.bodyLarge!.fontSize,color: Colors.grey[900]),)),
                          Container(padding: const EdgeInsets.only(top: 2, left: 25,),child: Text(_elements[index]["symbol"],style: TextStyle(fontSize:24,color: Colors.black ),)),
                          // Divider(
                          //   color: _elements[index]["category"] == "Alkali Metal"
                          //       ? Colors.red
                          //       : _elements[index]["category"] == "Reactive Nonmetal"
                          //       ? Colors.teal
                          //       : _elements[index]["category"] == "Alkaline Earth Metal"
                          //       ? Colors.yellow
                          //       : _elements[index]["category"] == "Transition Metal"
                          //       ? Colors.blue
                          //       : _elements[index]["category"] == "Lanthanide"
                          //       ? Colors.deepOrange
                          //       : _elements[index]["category"] == "Actinide"
                          //       ? Colors.pink
                          //       : _elements[index]["category"] == "Post-transition Metal"
                          //       ? Colors.purple
                          //       : Colors.white,
                          // ),
                          // Text(_elements[index]["symbol"],style: TextStyle(fontSize:24,color: _elements[index]["category"] == "Alkali Metal"
                          //     ? Colors.red
                          //     : _elements[index]["category"] == "Reactive Nonmetal"
                          //     ? Colors.teal
                          //     : _elements[index]["category"] == "Alkaline Earth Metal"
                          //     ? Colors.yellow
                          //     : _elements[index]["category"] == "Transition Metal"
                          //     ? Colors.blue
                          //     : _elements[index]["category"] == "Lanthanide"
                          //     ? Colors.deepOrange
                          //     : _elements[index]["category"] == "Actinide"
                          //     ? Colors.pink
                          //     : _elements[index]["category"] == "Post-transition Metal"
                          //     ? Colors.purple
                          //     : Colors.white, ),),
                          Container(padding: const EdgeInsets.only(top: 3, left: 2,),child: FittedBox(child: Text(_elements[index]["name"],style: TextStyle(fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize, color: Colors.black),))),

                         // FittedBox(child: Text(_elements[index]["category"],style: TextStyle(fontSize: Theme.of(context).textTheme.bodySmall!.fontSize),)),
                        ],
                      ),
                    ),
                  ),
                ),
              );}
          //
          //
          //   //     Column(
          //   //   children: [
          //   //     _elements.isNotEmpty ? Expanded(
          //   //       child: ListView.builder(
          //   //         itemCount: _elements.length,
          //   //         itemBuilder: (context, index) {
          //   //           print(_elements[index]);
          //   //           return
          //   //         },
          //   //       ),
          //   //     ) : ElevatedButton(
          //   //       onPressed: (){
          //   //         readJson();
          //   //       },
          //   //       child: Center(child: Text("adadsds"),),
          //   //     )
          //   //   ],
          //   // ),
          // )
    ),
        ),
      )
    );
  }

  // _buildTable(List<dynamic>? elements) {
  //   final tiles = elements
  //       ?.map((element) => elements != null
  //       ? ElementTitle (element:  element!)
  //       : Container(
  //     margin: EdgeInsets.all(1.w),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //   ))
  //       .toList();
  //   return SingleChildScrollView(
  //     child: SizedBox(
  //       height: 100.h,
  //       child: GridView.count(
  //         crossAxisCount: 10,
  //         scrollDirection: Axis.horizontal,
  //         children: tiles!,
  //       ),
  //     ),
  //   );
  // }
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

