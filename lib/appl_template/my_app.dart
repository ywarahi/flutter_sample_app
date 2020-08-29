// Sample: BottomNavigationBar
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/appl_template/about_page.dart';
import 'package:flutter_sample_app/appl_template/inbox_page.dart';
import 'package:flutter_sample_app/appl_template/tabs_page.dart';

import 'tab1_page.dart';

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
    _pageController = PageController(keepPage: true);
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
          InboxPage(PageStorageKey<String>('InboxPage')),
          //Tab1Page('受信'), // InboxView(), //('受信'),
          TabsPage('検索', PageStorageKey<String>('Tabs')),
          AboutPage(PageStorageKey<String>('AboutPage')),
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
      floatingActionButton: FloatingActionButton(child: Icon(Icons.search),),
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
