import 'package:flutter/material.dart';
import 'package:flutter_sample_app/appl_template/my_app.dart' as Appl;
import 'package:flutter_sample_app/original/my_app.dart' as Original;
import 'package:flutter_sample_app/state_notifier/my_app.dart' as StateNotifier;
import 'package:flutter_sample_app/state_notifier2/my_app.dart'
    as StateNotifier2;
import 'package:flutter_sample_app/hero/my_app.dart' as Hero;
import 'package:flutter_sample_app/riverpod/my_app.dart' as Riverpod;
import 'package:flutter_sample_app/tab/my_app.dart' as Tab;
import 'package:flutter_sample_app/tab_scrollable/my_app.dart' as TabScrollable;
import 'package:flutter_sample_app/tab_nested/my_app.dart' as TabNested;
import 'package:flutter_sample_app/draggable_scrollbar/my_app.dart' as DraggableScrollbar;
import 'package:flutter_sample_app/tab_sliver/my_app.dart' as TabSliver;
import 'package:flutter_sample_app/bottom_navigation_bar/my_app.dart' as BottomNavi;
import 'package:flutter_sample_app/horizontal_data_table/my_app.dart' as HDataTable;
import 'package:flutter_sample_app/sqlite_data_table/my_app.dart' as SQLDataTable;

void main() {
  runApp(MaterialApp(
    title: 'Billiards News',
    home: HomePage(),
    routes: {
      '/APPL': (BuildContext context) => Appl.MyApp(),
      '/ORIGINAL': (BuildContext context) => Original.MyApp(),
      '/HERO': (BuildContext context) => Hero.MyApp(),
      '/RIVERPOD': (BuildContext context) => Riverpod.MyApp(),
      '/STATE_NOTIFIER': (BuildContext context) => StateNotifier.MyApp(),
      '/STATE_NOTIFIER2': (BuildContext context) => StateNotifier2.MyApp(),
      '/TAB': (BuildContext context) => Tab.MyApp(),
      '/SCROLLABLE_TAB': (BuildContext context) => TabScrollable.MyApp(),
      '/TAB_NESTED': (BuildContext context) => TabNested.MyApp(),
      '/DRAGGABLE_SCROLLBAR': (BuildContext context) => DraggableScrollbar.MyApp(),
      '/TAB_SLIVER': (BuildContext context) => TabSliver.MyApp(),
      '/BOTTOM_NAVI': (BuildContext context) => BottomNavi.MyApp(),
      '/H_DATA_TABLE': (BuildContext context) => HDataTable.MyApp(),
      '/SQL_DATA_TABLE': (BuildContext context) => SQLDataTable.MyApp(),
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget getItem(String name, String path) {
      return ListTile(
        title: Text(name),
        onTap: () {
          Navigator.pop(context); //Drawer
          Navigator.of(context).pushNamed(path);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Samples'),
      ),
      drawer: DrawerView(),
      body: ListView(
        children: <Widget>[
          getItem('APPL', '/APPL'),
          getItem('ORIGINAL', '/ORIGINAL'),
          getItem('HERO', '/HERO'),
          getItem('RIVERPOD', '/RIVERPOD'),
          getItem('STATE_NOTIFIER', '/STATE_NOTIFIER'),
          getItem('STATE_NOTIFIER2', '/STATE_NOTIFIER2'),
          getItem('TAB', '/TAB'),
          getItem('SCROLLABLE_TAB', '/SCROLLABLE_TAB'),
          getItem('TAB_NESTED', '/TAB_NESTED'),
          getItem('DRAGGABLE_SCROLLBAR', '/DRAGGABLE_SCROLLBAR'),
          getItem('TAB_SLIVER', '/TAB_SLIVER'),
          getItem('BOTTOM_NAVI', '/BOTTOM_NAVI'),
          getItem('H_DATA_TABLE', '/H_DATA_TABLE'),
          getItem('SQL_DATA_TABLE', '/SQL_DATA_TABLE'),
        ],
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget getDrawerItem(String name, String path) {
      return ListTile(
        title: Text(name),
        onTap: () {
          Navigator.pop(context); //Drawer
          Navigator.of(context).pushNamed(path);
        },
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: const Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          getDrawerItem('ORIGINAL', '/ORIGINAL'),
          getDrawerItem('HERO', '/HERO'),
          getDrawerItem('RIVERPOD', '/RIVERPOD'),
          getDrawerItem('STATE_NOTIFIER', '/STATE_NOTIFIER'),
          getDrawerItem('STATE_NOTIFIER2', '/STATE_NOTIFIER2'),
        ],
      ),
    );
  }
}
