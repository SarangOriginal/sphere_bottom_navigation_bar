import 'package:flutter/material.dart';
import 'package:sphere_bottom_navigation_bar/sphere_bottom_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Color backgroudColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor,
      appBar: AppBar(
        backgroundColor: backgroudColor,
        title: Center(child: Text('Sphere Bottom Navigation')),
        elevation: 0,
      ),
      bottomNavigationBar: SphereBottomNavigationBar(
        defaultSelectedItem: 0,
        sheetRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        onItemPressed: (index) => setState(() {
              print('Selected item is - $index');
              switch (index) {
                case 0:
                  backgroudColor = Color(0xFFFFD6B2);
                  break;
                case 1:
                  backgroudColor = Color(0xFFB2F4FF);
                  break;
                case 2:
                  backgroudColor = Color(0xFFCDB2FF);
                  break;
                case 3:
                  backgroudColor = Color(0xFFFFB2D9);
                  break;
                default:
              }
            }),
        onItemLongPressed: (index) => setState(() {
              backgroudColor = Color(0xFF44D6B2);
            }),
        navigationItems: [
          BuildNavigationItem(
            tooltip: 'Home',
            itemColor: Color(0xFFFFD6B2),
            icon: Icon(Icons.home),
            selectedItemColor: Color(0xFFFFD6B2),
          ),
          BuildNavigationItem(
            tooltip: 'Chat',
            itemColor: Color(0xFFB2F4FF),
            icon: Icon(Icons.chat),
            selectedItemColor: Color(0xFFB2F4FF),
          ),
          BuildNavigationItem(
            tooltip: 'Peoples',
            itemColor: Color(0xFFCDB2FF),
            icon: Icon(Icons.people),
            selectedItemColor: Color(0xFFCDB2FF),
          ),
          BuildNavigationItem(
              tooltip: 'Settings',
              itemColor: Color(0xFFFFB2D9),
              icon: Icon(Icons.settings),
              selectedItemColor: Color(0xFFFFB2D9)),
        ],
      ),
      body: Container(
        color: backgroudColor,
      ),
    );
  }
}
