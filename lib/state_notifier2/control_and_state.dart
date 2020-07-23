import 'dart:async';
import 'dart:io';

import 'package:state_notifier/state_notifier.dart';
import 'package:flutter_sample_app/logging.dart';

class MyCountAState {
  MyCountAState() {
    log('★:$counter/$updateDate');
  }

  MyCountAState.init(this.counter) {
    updateDate = DateTime.now();
    log('★:$counter/$updateDate');
  }

  int counter = -1;
  DateTime updateDate;

  @override
  String toString() {
    return '$counter/$updateDate';
  }
}

class MyCountAControl extends StateNotifier<MyCountAState> with LocatorMixin {
  MyCountAControl(MyCountAState state) : super(state);

  @override
  void initState() {
    log('◇BEGIN:${state.counter}/${state.updateDate}');
    state = MyCountAState.init(0);
    log('◆END:${state.counter}/${state.updateDate}');
  }

  void increment() {
    log('◇BEGIN:${state.counter}/${state.updateDate}');
    state = MyCountAState.init(state.counter + 1);
    log('◆END:${state.counter}/${state.updateDate}');
  }
}

class MyCountBState {
  MyCountBState() {
    log('★:$counter/$updateDate');
  }

  MyCountBState.init(this.counter) {
    updateDate = DateTime.now();
    //sleep(Duration(seconds: 3));
    log('★:$counter/$updateDate');
  }

  MyCountBState.from(this.counter, this.updateDate) {
    //sleep(Duration(seconds: 3));
    log('★:$counter/$updateDate');
  }

  int counter = -1;
  DateTime updateDate;

  @override
  String toString() {
    return '$counter/$updateDate';
  }
}

class MyCountBControl extends StateNotifier<MyCountBState> with LocatorMixin {
  MyCountBControl(MyCountBState state) : super(state);

  @override
  void update(Locator watch) {
    log('◇BEGIN:${state.counter}/${state.updateDate}');
    super.update(watch);

    final stateA = watch<MyCountAState>();
    if ((stateA.updateDate != null && state.updateDate==null) ||
        (stateA.updateDate != null && state.updateDate != null &&
        stateA.updateDate.isAfter(state.updateDate)) ) {
      state = MyCountBState.init(watch<MyCountAState>().counter);
      log('◆END:${state.counter}/${state.updateDate}');
    } else {
      log('◇SKIP');
    }
  }

  void increment() {
    log('◇BEGIN:${state.counter}/${state.updateDate}');
    state = MyCountBState.from(state.counter + 1, state.updateDate);
    log('◆END:${state.counter}/${state.updateDate}');
  }
}
