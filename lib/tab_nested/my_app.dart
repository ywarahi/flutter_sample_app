import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsWidget('TABS',
          [
        Tab(child: Text('一覧')),
        Tab(child: Text('検索')),
        Tab(child: Text('お気に入り')),
      ], [
        Icon(Icons.directions_car),
        Icon(Icons.directions_boat),
        TabsWidget.noTitle([
          Tab(child: Text('111')),
          Tab(child: Text('222')),
          Tab(child: Text('333')),
        ], [
          Icon(Icons.directions_car),
          Icon(Icons.directions_boat),
          Icon(Icons.directions_bus),
        ]),
      ]),
    );
  }
}

class TabsWidget extends StatelessWidget {
  TabsWidget(this._title, this._tabs, this._tabBarViews) {
    _appBar = PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        title: Text(_title),
        bottom: TabBar(
          // タブのオプション
          //isScrollable: true,
          unselectedLabelColor: Colors.white.withOpacity(0.3),
          indicatorColor: Colors.white,
          labelColor: Colors.yellowAccent,
          labelStyle: TextStyle(fontSize: 14.0),
          unselectedLabelStyle: TextStyle(fontSize: 12.0),
//          indicatorWeight: 2.0,
          // タブに表示する内容
          tabs: _tabs,
        ),
      ),
    );
  }

  TabsWidget.noTitle(this._tabs, this._tabBarViews) {
    _appBar = PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: AppBar(
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
        TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.white.withOpacity(0.3),
          indicatorColor: Colors.white,
          labelColor: Colors.yellowAccent,
          labelStyle: TextStyle(fontSize: 14.0),
          unselectedLabelStyle: TextStyle(fontSize: 12.0),
          indicatorWeight: 2.0,
          tabs: _tabs,
        ),
          ],
        ),
      ),
    );
  }

  String _title;
  Widget _appBar;
  List<Widget> _tabs;
  List<Widget> _tabBarViews;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // タブの数
      length: _tabs.length,
      child: Scaffold(
        appBar: _appBar,
        body: TabBarView(
          children: _tabBarViews,
        ),
      ),
    );
  }
}
