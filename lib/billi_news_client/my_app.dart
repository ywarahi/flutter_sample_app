// Sample: BottomNavigationBar
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/billi_news_client/tabs.dart';

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
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          Tabs('受信'),
          Tabs('検索'),
          Tabs('About'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cloud_download), title: Text("受信")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("検索")),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), title: Text("About")),
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

//class PageWidget extends StatelessWidget {
//  final Color color;
//  final String title;
//
//  PageWidget({Key key, this.color, this.title}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: color,
//      child: Center(
//        child: Text(
//          title,
//          style: TextStyle(
//            fontSize: 25,
//          ),
//        ),
//      ),
//    );
//  }
//}