import 'package:apps/pageOne.dart';
import "package:flutter/material.dart";

void main()
{
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pageOne(),
      initialRoute: pageOne.root,
      routes: {
        pageOne.root: (context) => pageOne(),
      },
    );
  }
}