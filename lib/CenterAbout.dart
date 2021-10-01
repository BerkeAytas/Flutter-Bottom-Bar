import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterAbouta extends StatefulWidget {
  const CenterAbouta({Key? key}) : super(key: key);

  @override
  _CenterAboutaState createState() => _CenterAboutaState();
}

class _CenterAboutaState extends State<CenterAbouta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routing Page"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text("Furkan was here"),
            onPressed: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => Page2()));
            },
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: Container(
        child: Center(
          child: Text("Page 2"),
        ),
      ),
    );
  }
}
