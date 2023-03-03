import 'package:flutter/material.dart';
import 'package:restaurant/utils/px2dp.dart';

class TabLayoutWidget extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> tabContents;

  const TabLayoutWidget(
      {super.key, required this.tabs, required this.tabContents});

  @override
  State<TabLayoutWidget> createState() => _TabLayoutWidgetState();
}

class _TabLayoutWidgetState extends State<TabLayoutWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
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
          isScrollable: true,
          indicatorColor: Colors.transparent,
          labelColor: const Color(0xFFFF9A51),
          unselectedLabelColor: const Color(0xFF888B8B),
          labelStyle: TextStyle(
            fontFamily: 'PoppinsMedium',
            fontSize: 16.px3pt,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'PoppinsMedium',
            fontSize: 12.px3pt,
            fontWeight: FontWeight.w400,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabContents,
          ),
        )
      ],
    );
  }
}
