
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/entities/QRResEntity.dart';
import 'package:restaurant/viewmodel/canteen_provider.dart';

import '../../entities/category.dart';
import '../../entities/dish.dart';


class CanteenDetailsScreen extends StatefulWidget {
  final QRResEntity qrResEntity;

  const CanteenDetailsScreen({
    super.key,
    required this.qrResEntity,
  });

  @override
  State<CanteenDetailsScreen> createState() => _CanteenDetailsScreenState();
}

class _CanteenDetailsScreenState extends State<CanteenDetailsScreen> {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext pageContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.qrResEntity.canteenName),
        centerTitle: true,
      ),
      body: Consumer<CanteenProvider> (builder: (context, provider, _) {
        provider.dataList.length;
        return const Placeholder();
      }),
    );
  }
}
