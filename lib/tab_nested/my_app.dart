import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsWidget([
        Tab(child: Text('111')),
        Tab(child: Text('222')),
        Tab(child: Text('333')),
      ], [
        Icon(Icons.directions_car),
        Icon(Icons.directions_boat),
        TabsWidget([
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
  TabsWidget(this._tabs, this._tabBarViews);

  List<Widget> _tabs;
  List<Widget> _tabBarViews;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // タブの数
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(title:
        TabBar(
            // タブのオプション
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            indicatorColor: Colors.white,
            labelColor: Colors.yellowAccent,
            labelStyle: TextStyle(fontSize: 16.0),
            unselectedLabelStyle: TextStyle(fontSize: 12.0),
            indicatorWeight: 2.0,
            // タブに表示する内容
            tabs: _tabs,
          )),
          //title: Text('Tabs Demo'),
        body: TabBarView(
          children: _tabBarViews,
        ),
      ),
    );
  }
}
