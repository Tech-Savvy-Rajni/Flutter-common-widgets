import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final List<Tab> tabs;
  final List<Widget> views;
  final TabController tabController;
  final double height;
  final double width;
  TabBarWidget({
    Key? key,
    required this.tabs,
    required this.views,
    required this.tabController,
    required this.height,
    required this.width,
  }) : super(key: key);
  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: [
          TabBar(
            controller: widget.tabController,
            tabs: widget.tabs,
          ),
          Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              controller: widget.tabController,
              children: widget.views,
            ),
          ),
        ],
      ),
    );
  }
}
