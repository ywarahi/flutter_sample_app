import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier/state_notifier.dart';

class MyCountControl extends StateNotifier<MyCountState> {
  MyCountControl(MyCountState state) : super(state);

  void increment() {
    state = MyCountState.from(state.counter + 1);
  }
}

class MyCountState {
  MyCountState({this.counter = 0});

  MyCountState.from(this.counter);

  int counter;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StateNotifierProvider<MyCountControl, MyCountState>(
              create: (_) => MyCountControl(MyCountState())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
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
              Provider.of<MyCountState>(context, listen: true).counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Hero(
              tag: "HeroSample",
              child: RaisedButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void> (
                      builder: (BuildContext context) {
                        return DetailPage("HeroSample", Colors.red);
                      }
                  ));
                },
              ),
            ),
            Hero(
              tag: "HeroSample2",
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void> (
                      builder: (BuildContext context) {
                        return DetailPage("HeroSample2", Colors.blue);
                      }
                  ));
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<MyCountControl>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DetailPage extends StatelessWidget {
  DetailPage(this.tag, this.color);

  String tag;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body:
        Column(
          children: <Widget>[
            Hero(
                tag: this.tag, //"HeroSample",
                child: RaisedButton(
                  color: this.color, //Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
            ),
            Text(
              Provider.of<MyCountState>(context, listen: true).counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Icon(Icons.add),
              onPressed: () {
                Provider.of<MyCountControl>(context, listen: false).increment();
              })
          ],
        )
//      Container(
//        alignment: Alignment.topLeft,
//        padding: EdgeInsets.all(24.0),
//        child: Container(
//          width: 100,
//          height: 90,
//          child: Hero(
//              tag: this.tag, //"HeroSample",
//              child: RaisedButton(
//                color: this.color, //Colors.red,
//                onPressed: () {
//                  Navigator.of(context).pop();
//                },
//              )
//          ),
//        ),
//      ),
    );
  }
}


