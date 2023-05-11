import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Details extends StatefulWidget {
  final int index;

  const Details(this.index);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List _elements = [];

  Future readJson() async {
    final String response =
        await rootBundle.loadString("assets/data/elementsData.json");
    final data = json.decode(response);
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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("Element Details"),
      ),
      body: Center(
        child: Hero(
          tag: "${widget.index}",
          child: Card(
            //color: Colors.blueGrey,
            // color: _elements[widget.index]["category"] == "Alkali Metal"
            //     ? Colors.red
            //     : _elements[widget.index]["category"] == "Reactive Nonmetal"
            //     ? Colors.teal
            //     : _elements[widget.index]["category"] == "Alkaline Earth Metal"
            //     ? Colors.yellow
            //     : _elements[widget.index]["category"] == "Transition Metal"
            //     ? Colors.blue
            //     : _elements[widget.index]["category"] == "Lanthanide"
            //     ? Colors.deepOrange
            //     : _elements[widget.index]["category"] == "Actinide"
            //     ? Colors.pink
            //     : _elements[widget.index]["category"] == "Post-transition Metal"
            //     ? Colors.purple
            //     : Colors.white,
            color: _elements[widget.index]["category"] == "Alkali Metal"
                ? Colors.redAccent
                : _elements[widget.index]["category"] == "Reactive Nonmetal"
                ? Colors.blue
                : _elements[widget.index]["category"] == "Alkaline Earth Metal"
                ? Colors.green
                : _elements[widget.index]["category"] == "Transition Metal"
                ? Colors.yellow[700]
                : _elements[widget.index]["category"] == "Lanthanide"
                ? Colors.deepOrange
                : _elements[widget.index]["category"] == "Actinide"
                ? Colors.pink
                : _elements[widget.index]["category"] == "Post-transition Metal"
                ? Colors.purple
                : Colors.grey,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //NAME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30, left: 10),
                          //height: 100,
                          child: Text(
                            "Name",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(_elements[widget.index]["name"].toString(), style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                              color: Colors.black),),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //SYMBOL
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Symbol",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(_elements[widget.index]["symbol"].toString(), style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                              color: Colors.black),),
                        )
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     Container(
                    //       padding: EdgeInsets.only(top: 30, left: 10),
                    //       //height: 100,
                    //       child: Text(
                    //         "Symbol",
                    //         style: TextStyle(fontWeight: FontWeight.bold,
                    //             fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    //             color: Colors.black),
                    //       ),
                    //     ),
                    //     Container(
                    //       padding: EdgeInsets.only(top: 40, left: 10),
                    //       child: Text(
                    //         _elements[widget.index]["symbol"],
                    //         style: TextStyle(
                    //             fontSize: 24,
                    //             color: Colors.black, fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //const SizedBox(height: 5,),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //ATOMIC NUMBER
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Atomic Number",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(_elements[widget.index]["number"].toString(), style: TextStyle(
                            fontWeight: FontWeight.w500,
                              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                              color: Colors.black),),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),

                    //ATOMIC MASS
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Atomic mass",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(_elements[widget.index]["atomic_weight"].toString(), style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                              color: Colors.black),),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),


                    //CATEGORY
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Category",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(_elements[widget.index]["category"].toString(), style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                              color: Colors.black),),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),


                    //EXTRACT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Extract",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(_elements[widget.index]["extract"].toString(), style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                              color: Colors.black),),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),


                    //SOURCE
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          //height: 100,
                          child: Text(
                            "Source",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                          child: Text(_elements[widget.index]["source"].toString(), style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                              color: Colors.black),),
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black38,
                      height: 2,
                      indent: 10,
                      endIndent: 10,
                      thickness: 3,
                    ),
                    const SizedBox(height: 20),
                    // Container(
                    //   padding: EdgeInsets.only(top: 40, left: 10),
                    //   //height: 100,
                    //   child: Text(
                    //     "Atomic Number:" + _elements[widget.index]["number"].toString(),
                    //     style: TextStyle(
                    //         fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    //         color: Colors.black),
                    //   ),
                    // ),
                    // Text(
                    //   _elements[widget.index]["symbol"],
                    //   style: TextStyle(
                    //       fontSize: 24,
                    //       color:
                    //           widget.index % 2 == 0 ? Colors.green : Colors.yellow),
                    // ),
                    // FittedBox(
                    //     child: Text(
                    //   _elements[widget.index]["name"],
                    //   style: TextStyle(
                    //       fontSize:
                    //           Theme.of(context).textTheme.bodyMedium!.fontSize),
                    // )),
                    // Text(_elements[widget.index]["extract"])

                    // FittedBox(child: Text(_elements[index]["category"],style: TextStyle(fontSize: Theme.of(context).textTheme.bodySmall!.fontSize),)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
