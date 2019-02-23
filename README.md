# sphere_bottom_navigation_bar

A new Flutter package.

## Getting Started

# Add the dependencies to [pubspec.yaml] 
```yaml
dependencies:
  flutter:
    sdk: flutter
  sphere_bottom_navigation_bar: 0.0.1
```
## How to use 
```
import 'package:flutter/material.dart';
import 'SphereBottomNavigationBar.dart';

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
```






# ![Screenshot](Simulator_Screen_Shot_iPhone_XS_2019_02_23_at_18_33_50.png)




