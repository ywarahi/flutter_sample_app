import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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


final StateNotifierProvider<MyCountControl> countProvider =
StateNotifierProvider((ref) => MyCountControl(MyCountState()));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
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
    return Consumer((context, read) {
      final countState = read(countProvider.state);
      final countControl = read(countProvider);
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
              Text(countState.counter.toString(),
                //Provider.of<MyCountState>(context, listen: true).counter.toString(),
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countControl.increment();
            //Provider.of<MyCountControl>(context, listen: false).increment();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
