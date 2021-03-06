import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage(Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          floating: true,
          pinned: true,
          snap: true,
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
          ),
        ),
        // SliverFixedExtentList(
        //   itemExtent: 200.0,
        //   delegate: SliverChildBuilderDelegate(
        //         (BuildContext context, int index) {
        //       return Container(
        //         alignment: Alignment.center,
        //         color: Colors.lightBlue[100 * (index % 9)],
        //         child: Text('list item $index', style: TextStyle(fontSize: 30),),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}