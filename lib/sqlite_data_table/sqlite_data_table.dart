import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class SQLiteDataTable extends StatefulWidget {
  SQLiteDataTable(this.table, {Key key, this.title}) : super(key: key);
  final String title;
  List<Map<String, dynamic>> table;

  @override
  _SQLiteDataTableState createState() => _SQLiteDataTableState();
}

class _SQLiteDataTableState extends State<SQLiteDataTable> {
  bool isAscending = true;

  @override
  void initState() {
    // user.initData(100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getBodyWidget(),
    );
  }

  //HorizontalDataTable
  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 50,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleList(),
        leftSideItemBuilder: _getFirstColumn,
        rightSideItemBuilder: _getRow,
        itemCount: widget.table.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        // leftHandSideColBackgroundColor: Color(0xFF2A2A2A),
        // rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
      height: MediaQuery
          .of(context)
          .size
          .height,
    );
  }

  //Ｒ×１ヘッダ：List<Widget>　
  List<Widget> _getTitleList() {
    final row = widget.table[0];
    final header = row.keys.map((e) {
      return _getTitleItem(e, 100);
    }).toList();
    header.insert(0, _getTitleItem('#', 50));
    return header;
  }

  //１×１ヘッダ：Widget
  Widget _getTitleItem(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  //１×Ｃ列：Widget（index）
  Widget _getFirstColumn(BuildContext context, int index) {
    return _getCell(index, 50, 52);
  }

  //Ｒ×Ｃ－１行：Row（index）
  Widget _getRow(BuildContext context, int index) {
    var row = widget.table[index];
    final rowList = row.keys.map((k) {
      return _getCell(row[k], 100, 52);
    }).toList();
    return Row(
      children: rowList,
    );
  }

  //１×１セル：Widget
  Widget _getCell(dynamic value, double width, double height) {
    return Container(
      child: Text(value.toString()),
      width: width,
      height: height,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }
}
