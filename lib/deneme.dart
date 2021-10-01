import 'package:bottom_bar/CenterAbout.dart';
import 'package:flutter/material.dart';

class Deneme extends StatefulWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  _DenemeState createState() => _DenemeState();
}

class _DenemeState extends State<Deneme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () {
          /*pushDynamicScreen(
            context,
            screen: CenterAbouta(),
            withNavBar: true,
          );*/
          Navigator.push(context, MaterialPageRoute(builder: (context) => CenterAbouta()));
        },
        child: Text("dataasdasd"),
      )),
    );
  }
}
