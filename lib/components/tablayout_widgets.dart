import 'package:flutter/material.dart';

class TabLayoutWidget extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> tabContents;

  TabLayoutWidget({required this.tabs, required this.tabContents});

  @override
  _TabLayoutWidgetState createState() => _TabLayoutWidgetState();
}

class _TabLayoutWidgetState extends State<TabLayoutWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: widget.tabs,
          controller: _tabController,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabContents,
          ),
        ),
      ],
    );
  }
}
