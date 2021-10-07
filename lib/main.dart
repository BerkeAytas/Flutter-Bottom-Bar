import 'package:bottom_bar/CenterAbout.dart';
import 'package:bottom_bar/fab_with_icons.dart';
import 'package:bottom_bar/fab_bottom_app_bar.dart';
import 'package:bottom_bar/getXController.dart';
import 'package:bottom_bar/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'BottomAppBar with FAB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  var getXController = Get.put(GetXController());

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectedTabe(int index) {
    getXController.doAnimation();
  }

  void _selectedFab(int index) {
    setState(() {
      _selectedIndex = 4 + index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      Anasayfa(),
      Sepetim(),
      Kampanyalar(),
      Profil(),
      UrunKategori(),
      EsnafKategori(),
      RoutingPage(),
      CenterAbouta(),
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          pageList[_selectedIndex],
          Obx(
            () => getXController.fabClicked.value
                ? GestureDetector(
                    onTap: () {
                      getXController.doAnimation();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => getXController.fabClicked.value
          ? GestureDetector(
              onTap: () {
                getXController.doAnimation();
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: FABBottomAppBar(
                  backgroundColor: Colors.white.withOpacity(0.6),
                  centerItemText: 'A',
                  color: Colors.grey,
                  selectedColor: Colors.blue,
                  notchedShape: CircularNotchedRectangle(),
                  onTabSelected: _selectedTabe,
                  items: [
                    FABBottomAppBarItem(iconData: Icons.store, text: 'Anasayfa'),
                    FABBottomAppBarItem(iconData: Icons.shopping_basket, text: 'Sepetim'),
                    FABBottomAppBarItem(iconData: Icons.person, text: 'Kampanyalar'),
                    FABBottomAppBarItem(iconData: Icons.business, text: 'Profil'),
                  ],
                ),
              ),
            )
          : FABBottomAppBar(
              backgroundColor: Colors.white,
              centerItemText: 'A',
              color: Colors.grey,
              selectedColor: Colors.blue,
              notchedShape: CircularNotchedRectangle(),
              onTabSelected: _selectedTab,
              items: [
                FABBottomAppBarItem(iconData: Icons.store, text: 'Anasayfa'),
                FABBottomAppBarItem(iconData: Icons.shopping_basket, text: 'Sepetim'),
                FABBottomAppBarItem(iconData: Icons.person, text: 'Kampanyalar'),
                FABBottomAppBarItem(iconData: Icons.business, text: 'Profil'),
              ],
            )),
      floatingActionButton: _buildFab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFab(BuildContext context) {
    final List<IconData> icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child:
          // Container()
          FloatingActionButton(
        onPressed: () {
          print("deneme");
        },
        tooltip: 'Increment',
        child: Icon(Icons.ac_unit),
        elevation: 2.0,
      ),
    );
  }
}

class RoutingPage extends StatelessWidget {
  const RoutingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (setting) {
          return CupertinoPageRoute(builder: (_) => CenterAbouta());
        },
      ),
      //  Center(
      //   child: TextButton(
      //     onPressed: () => _selectedFab(3),
      //     child: Text("Berke"),
      //   ),
      // ),
    );
  }
}

class EsnafKategori extends StatelessWidget {
  const EsnafKategori({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Esnaf Kategori",
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    );
  }
}

class UrunKategori extends StatelessWidget {
  const UrunKategori({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Ürün Kategori",
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profil",
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    );
  }
}

class Kampanyalar extends StatelessWidget {
  const Kampanyalar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Kampanyalar",
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    );
  }
}

class Sepetim extends StatelessWidget {
  const Sepetim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepetim"),
      ),
      body: Center(
        child: Text(
          "Sepetim",
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    );
  }
}

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  "Anasayfa",
                  style: TextStyle(fontSize: 32.0),
                ),
                Container(
                  color: Colors.orange,
                  width: 100,
                  height: 900,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
