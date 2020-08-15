import 'package:flutter/material.dart';

class TabUI extends StatefulWidget
{
  final List<Widget> tabs;
  final List<Widget> children;

  TabUI({
    Key key,
    @required this.tabs,
    @required this.children,
  }): super(key: key);

  @override
  _TabUIState createState() => _TabUIState();
}

class _TabUIState extends State<TabUI>
{
  /// アクティブインジケーターの画面左側からのオフセット
  double _indicatorOffset = 0;
  /// アクティブインジケーターの幅
  double _indicatorWidth = 0;

  void _calculateIndicatorMeta()
  {
    final size = MediaQuery.of(context).size;

    _indicatorWidth = size.width / widget.tabs.length;
  }

  @override
  Widget build(BuildContext context)
  {
    return _buildChild();
  }

  Widget _buildChild()
  {
    return Stack(
      children: <Widget>[
        // Menus
        _buildMenus(),
        // Menu indicators
        _buildInactiveIndicator(),
        _buildActiveIndicator(),
      ],
    );
  }

  Widget _buildMenus()
  {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 50,
        width: double.infinity,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildTabs(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabs()
  {
    final tabs = <Widget>[];

    widget.tabs.asMap().forEach((index, tab) {
      tabs.add(
          Expanded(
            child: GestureDetector(
              child: Container(
                color: Colors.transparent,
                child: tab,
              ),
              onTap: () {
                // TODO: 後ほどボタンをタップした際の挙動を実装します。
              },
            ),
          )
      );
    });

    return tabs;
  }

  Widget _buildInactiveIndicator()
  {
    final List<Widget> indicators = [];

    widget.tabs.forEach((_) {
      indicators.add(
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              )
          ),
        ),
      );
    });

    return Positioned(
      top: 46,
      left: 0,
      right: 0,
      child: Row(
        children: indicators,
      ),
    );
  }

  Widget _buildActiveIndicator()
  {
    final double horizontalPadding = 2;

    return Positioned(
      top: 46,
      left: _indicatorOffset,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Container(
          height: 3,
          width: _indicatorWidth - (horizontalPadding * 2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.5),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 1)
                ),
              ]
          ),
        ),
      ),
    );
  }
}
