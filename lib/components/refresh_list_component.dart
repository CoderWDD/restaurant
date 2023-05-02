
import 'package:flutter/material.dart';
import 'package:restaurant/base/base_viewmodel.dart';

import '../base/view_state.dart';

class RefreshListComponent<T extends BaseViewModel> extends StatefulWidget {
  final T provider;
  final Axis scrollDirection;
  final Widget Function(dynamic itemData) itemBuilder;

  const RefreshListComponent(
      {Key? key,
      required this.provider,
      required this.itemBuilder,
      this.scrollDirection = Axis.vertical})
      : super(key: key);

  @override
  State<RefreshListComponent> createState() => _RefreshListComponentState<T>();
}

class _RefreshListComponentState<T extends BaseViewModel>
    extends State<RefreshListComponent> {
  @override
  Widget build(BuildContext context) {
    // if the state of the provider is loading, show a circular progress indicator
    if (widget.provider.viewState == ViewState.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // if the state of the provider is error, show an error message
    if (widget.provider.viewState == ViewState.error) {
      return const Center(
        child: Text('Failed to fetch dishes data.'),
      );
    }
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: _loadMore,
      child: ListView.builder(
        scrollDirection: widget.scrollDirection,
        itemCount: widget.provider.dataList.length +
            (widget.provider.hasMoreData ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == widget.provider.dataList.length) {
            return widget.provider.viewState == ViewState.loading
                ? const CircularProgressIndicator()
                : const SizedBox();
          } else {
            return widget.itemBuilder(widget.provider.dataList[index]);
          }
        },
      ),
    );
  }

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.microtask(() => _firstLoad());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMore();
    }
  }

  void _firstLoad() {
    widget.provider.getDataList();
  }

  Future<void> _loadMore() async {
    await widget.provider.getDataList();
  }
}
