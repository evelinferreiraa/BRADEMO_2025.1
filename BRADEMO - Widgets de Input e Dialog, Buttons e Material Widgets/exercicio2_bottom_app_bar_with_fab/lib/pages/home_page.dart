import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../widgets/fab_bottom_app_bar.dart';
import '../widgets/fab_bottom_app_bar_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  int? _selectedFab;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTab = index;
      _selectedFab = null; 
    });
  }

  void _onFabSelected(int index) {
    setState(() {
      _selectedFab = index;
    });
  }

  final List<FABBottomAppBarItem> items = [
    FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
    FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
    FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
    FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BottomAppBar with FAB',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        spacing: 20,
        children: [
          SpeedDialChild(
            backgroundColor: Colors.white,
            child: Icon(Icons.phone, color: Colors.blue),
            shape: CircleBorder(),
            onTap: () => _onFabSelected(0),
          ),
          SpeedDialChild(
            backgroundColor: Colors.white,
            child: Icon(Icons.email, color: Colors.blue),
            shape: CircleBorder(),
            onTap: () => _onFabSelected(1),
          ),
          SpeedDialChild(
            backgroundColor: Colors.white,
            child: Icon(Icons.message, color: Colors.blue),
            shape: CircleBorder(),
            onTap: () => _onFabSelected(2),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        items: items,
        centerItemText: 'A',
        height: 60.0,
        iconSize: 24.0,
        backgroundColor: Colors.white,
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onTabSelected,
        selectedIndex: _selectedTab,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedFab != null
                  ? 'FAB: $_selectedFab'
                  : 'TAB: $_selectedTab',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
