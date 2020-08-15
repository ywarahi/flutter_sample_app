import 'package:flutter/material.dart';
import 'package:flutter_sample_app/original/my_app.dart' as Original;
import 'package:flutter_sample_app/state_notifier/my_app.dart' as StateNotifier;
import 'package:flutter_sample_app/state_notifier2/my_app.dart'
    as StateNotifier2;
import 'package:flutter_sample_app/hero/my_app.dart' as Hero;
import 'package:flutter_sample_app/riverpod/my_app.dart' as Riverpod;

void main() {
  runApp(MaterialApp(
    title: 'Billiards News',
    home: HomePage(),
    routes: {
      '/ORIGINAL': (BuildContext context) => Original.MyApp(),
      '/HERO': (BuildContext context) => Hero.MyApp(),
      '/RIVERPOD': (BuildContext context) => Riverpod.MyApp(),
      '/STATE_NOTIFIER': (BuildContext context) => StateNotifier.MyApp(),
      '/STATE_NOTIFIER2': (BuildContext context) => StateNotifier2.MyApp(),
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
          getItem('ORIGINAL', '/ORIGINAL'),
          getItem('HERO', '/HERO'),
          getItem('RIVERPOD', '/RIVERPOD'),
          getItem('STATE_NOTIFIER', '/STATE_NOTIFIER'),
          getItem('STATE_NOTIFIER2', '/STATE_NOTIFIER2'),
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
