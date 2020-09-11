import 'package:flutter/material.dart';
import 'sqlite_data_table.dart';

List<Map<String, dynamic>> data = [
  {'id':'1', 'name':'hoga', 'Age':28},
  {'id':'2', 'name':'hoge', 'Age':29},
  {'id':'3', 'name':'hogo', 'Age':30},
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SQLiteDataTable(data, title: 'Flutter Demo Home Page'),
    );
  }
}
