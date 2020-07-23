import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sample_app/logging.dart';
import 'package:flutter_sample_app/state_notifier2/control_and_state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Provider.of<MyCountAControl>(context, listen: false).init();
    return MultiProvider(
      providers: [
        StateNotifierProvider<MyCountAControl, MyCountAState>(
            create: (_) => MyCountAControl(MyCountAState())),
        StateNotifierProvider<MyCountBControl, MyCountBState>(
            create: (_) => MyCountBControl(MyCountBState())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page')
//          (Provider.of<MyCountBState>(context, listen: false).updateDate ==
//                null)
//            ? const Center(child: CircularProgressIndicator())
//            : MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                Provider.of<MyCountAState>(context, listen: true)
                    .counter
                    .toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                Provider.of<MyCountBState>(context, listen: true)
                    .counter
                    .toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Provider.of<MyCountBControl>(context, listen: false)
                    .increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add_comment),
            ),
            FloatingActionButton(
              onPressed: () {
                Provider.of<MyCountAControl>(context, listen: false)
                    .increment();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          ],
        ));
  }
}
