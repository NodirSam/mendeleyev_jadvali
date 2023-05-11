import 'package:flutter/material.dart';
import 'package:mendeleyev_jadvali/models/elementsData_model.dart';

class ElementTitle extends StatefulWidget {
  ElementTitle({Key? key, required this.element}) : super(key: key);

  final ElementsData element;

  @override
  State<ElementTitle> createState() => _ElementTitleState();
}

class _ElementTitleState extends State<ElementTitle> {
  @override
  Widget build(BuildContext context) {
    final tileColumnText = <Widget>[
      Text("${widget.element.number}"),
    ];
    return InkWell(
      child: Container(
        child: Column(
          children: tileColumnText,
        ),
      ),
    );
  }
}
