import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

//void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  //provide the same scrollController for list and draggableScrollbar
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Draggable Scroll Bar Demo'),
        ),
        //DraggableScrollbar builds Stack with provided Scrollable List of Grid
        body: new DraggableScrollbar(
          child: _buildGrid(),
          heightScrollThumb: 40.0,
          controller: controller,
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      controller: controller, //scrollController is final in this stateless widget
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      padding: EdgeInsets.zero,
      itemCount: 1000,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(2.0),
          color: Colors.grey[300],
        );
      },
    );
  }
}

class DraggableScrollbar extends StatefulWidget {
  final double heightScrollThumb;
  final Widget child;
  final ScrollController controller;

  DraggableScrollbar({this.heightScrollThumb, this.child, this.controller});

  @override
  _DraggableScrollbarState createState() => new _DraggableScrollbarState();
}

class _DraggableScrollbarState extends State<DraggableScrollbar> {
  //this counts offset for scroll thumb in Vertical axis
  double _barOffset;
  //this counts offset for list in Vertical axis
  double _viewOffset;
  @override
  void initState() {
    super.initState();
    _barOffset = 0.0;
    _viewOffset = 0.0;
  }

  //if list takes 300.0 pixels of height on screen and scrollthumb height is 40.0
  //then max bar offset is 260.0
  double get barMaxScrollExtent =>
      context.size.height - widget.heightScrollThumb;
  double get barMinScrollExtent => 0.0;

  //this is usually lenght (in pixels) of list
  //if list has 1000 items of 100.0 pixels each, maxScrollExtent is 100,000.0 pixels
  double get viewMaxScrollExtent => widget.controller.position.maxScrollExtent;
  //this is usually 0.0
  double get viewMinScrollExtent => widget.controller.position.minScrollExtent;

  double getScrollViewDelta(
      double barDelta,
      double barMaxScrollExtent,
      double viewMaxScrollExtent,
      ) { //propotion
    return barDelta * viewMaxScrollExtent / barMaxScrollExtent;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _barOffset += details.delta.dy;

      if (_barOffset < barMinScrollExtent) {
        _barOffset = barMinScrollExtent;
      }
      if (_barOffset > barMaxScrollExtent) {
        _barOffset = barMaxScrollExtent;
      }

      double viewDelta = getScrollViewDelta(
          details.delta.dy, barMaxScrollExtent, viewMaxScrollExtent);

      _viewOffset = widget.controller.position.pixels + viewDelta;
      if (_viewOffset < widget.controller.position.minScrollExtent) {
        _viewOffset = widget.controller.position.minScrollExtent;
      }
      if (_viewOffset > viewMaxScrollExtent) {
        _viewOffset = viewMaxScrollExtent;
      }
      widget.controller.jumpTo(_viewOffset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      widget.child,
      GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          child: Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: _barOffset),
              child: _buildScrollThumb())),
    ]);
  }

  Widget _buildScrollThumb() {
    return new Container(
      height: widget.heightScrollThumb,
      width: 20.0,
      color: Colors.blue,
    );
  }
}