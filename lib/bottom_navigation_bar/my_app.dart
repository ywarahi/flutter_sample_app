// Sample: BottomNavigationBar
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Application Name'),
        elevation: 4.0,
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          PageWidget(color:Colors.white, title:'Home'),
          PageWidget(color:Colors.blue, title:'Album'),
          PageWidget(color:Colors.orange, title:'Setting'),
//          new HomePage(),
//          new SettingsPage(),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_album),
              title: Text("Album")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Setting")
          ),
        ],
      ),
    );
  }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}

class _MyAppState2 extends State<MyApp> {
  int _currentIndex = 0;
  final _pageWidgets = [
    PageWidget(color:Colors.white, title:'Home'),
    PageWidget(color:Colors.blue, title:'Album'),
    PageWidget(color:Colors.orange, title:'Chat'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: _pageWidgets.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.photo_album), title: Text('Album')),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chat')),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) => setState(() => _currentIndex = index );
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  PageWidget({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}