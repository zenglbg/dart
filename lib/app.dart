import 'package:flutter/material.dart';
import 'pages/dynamic.dart';
import 'pages/message.dart';
import 'pages/category.dart';
import 'pages/mine.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  int _index =
      0; // Make sure this is outside build(), otherwise every setState will chage the value back to 0

  List<Widget> _homeWidgets = [
    DynamicPage(),
    MessagePage(),
    CategoryPage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
      ),
      body: IndexedStack(
        index: _index,
        children: _homeWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (tappedItemIndex) => setState(() {
                _index = tappedItemIndex;
              }),
          currentIndex: _index,
          items: [
            _getBottomNavItem(label: '动态', icon: Icons.home, index: 0),
            _getBottomNavItem(
                label: '消息', icon: Icons.ac_unit_outlined, index: 1),
            _getBottomNavItem(label: '分类浏览', icon: Icons.add_call, index: 2),
            _getBottomNavItem(
                label: '个人中心', icon: Icons.camera_rounded, index: 3),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _index = 0;
        }),
        tooltip: 'Reset Navigation Index',
        child: Icon(Icons.clear), //Change Icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endFloat, //Change for different locations
    );
  }

  BottomNavigationBarItem _getBottomNavItem(
      {required String label, required IconData icon, required int index}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
