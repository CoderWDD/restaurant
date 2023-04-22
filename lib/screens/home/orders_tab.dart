import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/constants/assets_constants.dart';
import 'package:restaurant/utils/px2dp.dart';

import '../../base/view_state.dart';
import '../../entities/cart.dart';
import '../../viewmodel/all_cart_List_provider.dart';
import '../../viewmodel/served_cart_list_provider.dart';
import '../../viewmodel/unserved_cart_list_provider.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static List<String> tabTitles = ['All', 'Served', 'UnServed'];

  final List<Widget> _children = [
    const AllCartItemListComponent(),
    const ServedCartItemListComponent(),
    const UnServedCartItemListComponent(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabTitles.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabLayoutDelegate(
              TabBar(
                dragStartBehavior: DragStartBehavior.start,
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(4.px3pt),
                  borderSide: BorderSide(
                    width: 3.px3pt,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 16.px3pt),
                ),
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor:
                    Theme.of(context).colorScheme.onSurfaceVariant,
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
                controller: _tabController,
                tabs: tabTitles
                    .map((tabTitle) => Tab(
                          text: tabTitle,
                        ))
                    .toList(),
              ),
            ),
          ),
        ];
      },
      body: DefaultTabController(
        length: tabTitles.length,
        child: TabBarView(
          controller: _tabController,
          children: _children,
        ),
      ),
    );

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(right: 16.px3pt, bottom: 4.px3pt),
            color: Theme.of(context).colorScheme.onPrimary,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.px3pt,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsSemiBold',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TabLayoutDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabLayoutDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_TabLayoutDelegate oldDelegate) => false;
}

class AllCartItemListComponent extends StatefulWidget {
  const AllCartItemListComponent({Key? key}) : super(key: key);

  @override
  State<AllCartItemListComponent> createState() =>
      _AllCartItemListComponentState();
}

class _AllCartItemListComponentState extends State<AllCartItemListComponent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.microtask(() => firstLoad());
  }

  void firstLoad(){
    final provider = Provider.of<AllCartListProvider>(context, listen: false);
    provider.getCartList();
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

  Future<void> _loadMore() async{
    final provider = Provider.of<AllCartListProvider>(context, listen: false);
    await provider.getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AllCartListProvider>(builder: (context, provider, _) {
      // if the state of the provider is loading, show a circular progress indicator
      if (provider.viewState == ViewState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      // if the state of the provider is error, show an error message
      if (provider.viewState == ViewState.error) {
        return const Center(
          child: Text('Failed to fetch cart data.'),
        );
      }

      return Stack(
        children: [
          RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: _loadMore,
            child: ListView.builder(
              itemCount: provider.cartList.length + (provider.hasMoreData ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.cartList.length) {
                  return provider.viewState == ViewState.loading
                      ? const CircularProgressIndicator()
                      : const SizedBox();
                } else {
                  return CartItemComponent(onSelect: (bool? value) {  }, isSelect: false, cartItem: provider.cartList[index],);
                }
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(right: 16.px3pt, bottom: 4.px3pt),
              color: Theme.of(context).colorScheme.onPrimary,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.px3pt,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsSemiBold',
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class ServedCartItemListComponent extends StatefulWidget {
  const ServedCartItemListComponent({Key? key}) : super(key: key);

  @override
  State<ServedCartItemListComponent> createState() =>
      _ServedCartItemListComponentState();
}

class _ServedCartItemListComponentState
    extends State<ServedCartItemListComponent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.microtask(() => firstLoad());
  }

  void firstLoad(){
    final provider = Provider.of<ServeCartListProvider>(context, listen: false);
    provider.getServedCartList();
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

  Future<void> _loadMore() async{
    final provider = Provider.of<ServeCartListProvider>(context, listen: false);
    await provider.getServedCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ServeCartListProvider>(builder: (context, provider, _) {
      // if the state of the provider is loading, show a circular progress indicator
      if (provider.viewState == ViewState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      // if the state of the provider is error, show an error message
      if (provider.viewState == ViewState.error) {
        return const Center(
          child: Text('Failed to fetch cart data.'),
        );
      }

      return Stack(
        children: [
          RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: _loadMore,
            child: ListView.builder(
              itemCount: provider.cartList.length + (provider.hasMoreData ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.cartList.length) {
                  return provider.viewState == ViewState.loading
                      ? const CircularProgressIndicator()
                      : const SizedBox();
                } else {
                  return CartItemComponent(onSelect: (bool? value) {  }, isSelect: false, cartItem: provider.cartList[index],);
                }
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(right: 16.px3pt, bottom: 4.px3pt),
              color: Theme.of(context).colorScheme.onPrimary,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.px3pt,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsSemiBold',
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class UnServedCartItemListComponent extends StatefulWidget {
  const UnServedCartItemListComponent({Key? key}) : super(key: key);

  @override
  State<UnServedCartItemListComponent> createState() =>
      _UnServedCartItemListComponentState();
}

class _UnServedCartItemListComponentState
    extends State<UnServedCartItemListComponent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Future.microtask(() => firstLoad());
  }

  void firstLoad(){
    final provider = Provider.of<UnServeCartListProvider>(context, listen: false);
    provider.getUnServedCartList();
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

  Future<void> _loadMore() async{
    final provider = Provider.of<UnServeCartListProvider>(context, listen: false);
    await provider.getUnServedCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UnServeCartListProvider>(builder: (context, provider, _) {
      // if the state of the provider is loading, show a circular progress indicator
      if (provider.viewState == ViewState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      // if the state of the provider is error, show an error message
      if (provider.viewState == ViewState.error) {
        return const Center(
          child: Text('Failed to fetch cart data.'),
        );
      }

      return Stack(
        children: [
          RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: _loadMore,
            child: ListView.builder(
              itemCount: provider.cartList.length + (provider.hasMoreData ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == provider.cartList.length) {
                  return provider.viewState == ViewState.loading
                      ? const CircularProgressIndicator()
                      : const SizedBox();
                } else {
                  return CartItemComponent(onSelect: (bool? value) {  }, isSelect: false, cartItem: provider.cartList[index],);
                }
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(right: 16.px3pt, bottom: 4.px3pt),
              color: Theme.of(context).colorScheme.onPrimary,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.px3pt,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PoppinsSemiBold',
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class CartItemComponent extends StatefulWidget {
  final bool isSelect;
  final ValueChanged<bool?>? onSelect;
  final CartItem cartItem;
  const CartItemComponent({Key? key, required this.onSelect, required this.isSelect, required this.cartItem}) : super(key: key);

  @override
  State<CartItemComponent> createState() => _CartItemComponentState();
}

class _CartItemComponentState extends State<CartItemComponent> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.isSelect,
        onChanged: widget.onSelect,
      ),
      title: Text(
        widget.cartItem.name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(widget.cartItem.dishFlavor),
      trailing: Text(
        '\$${widget.cartItem.amount}',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}




class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late List<Order> _orders;

  bool _checkAll = false;

  String _totalPrice = '0.00';

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    // Load orders from an API or a database
    setState(() {
      _orders = [
        Order(
          quantity: 2,
          id: '1',
          products: [
            OrderItem(
              id: '1',
              title: 'Cheese Pizza',
              quantity: 2,
              price: 19.99,
            ),
            OrderItem(
              id: '2',
              title: 'Pasta',
              quantity: 1,
              price: 12.99,
            ),
          ],
          price: 52.97,
          dateTime: DateTime.now().subtract(Duration(days: 2)),
        ),
        Order(
          quantity: 2,
          id: '2',
          products: [
            OrderItem(
              id: '3',
              title: 'Chicken Tikka Masala',
              quantity: 1,
              price: 15.99,
            ),
            OrderItem(
              id: '4',
              title: 'Garlic Naan',
              quantity: 2,
              price: 3.99,
            ),
          ],
          price: 23.97,
          dateTime: DateTime.now().subtract(Duration(days: 1)),
        ),
        Order(
          quantity: 2,
          id: '3',
          products: [
            OrderItem(
              id: '5',
              title: 'Cheeseburger',
              quantity: 1,
              price: 8.99,
            ),
            OrderItem(
              id: '6',
              title: 'Fries',
              quantity: 1,
              price: 4.99,
            ),
            OrderItem(
              id: '7',
              title: 'Soda',
              quantity: 2,
              price: 1.99,
            ),
          ],
          price: 19.95,
          dateTime: DateTime.now(),
        ),
        Order(
          quantity: 2,
          id: '4',
          products: [
            OrderItem(
              id: '8',
              title: 'Fish and Chips',
              quantity: 2,
              price: 14.99,
            ),
            OrderItem(
              id: '9',
              title: 'Beer',
              quantity: 3,
              price: 6.99,
            ),
          ],
          price: 66.94,
          dateTime: DateTime.now(),
        ),
        Order(
          quantity: 2,
          id: '5',
          products: [
            OrderItem(
              id: '10',
              title: 'Spaghetti Carbonara',
              quantity: 1,
              price: 18.99,
            ),
            OrderItem(
              id: '11',
              title: 'Caesar Salad',
              quantity: 1,
              price: 7.99,
            ),
            OrderItem(
              id: '12',
              title: 'Breadsticks',
              quantity: 2,
              price: 2.99,
            ),
          ],
          price: 31.96,
          dateTime: DateTime.now(),
        ),
        Order(
          quantity: 2,
          id: '5',
          products: [
            OrderItem(
              id: '10',
              title: 'Spaghetti Carbonara',
              quantity: 1,
              price: 18.99,
            ),
            OrderItem(
              id: '11',
              title: 'Caesar Salad',
              quantity: 1,
              price: 7.99,
            ),
            OrderItem(
              id: '12',
              title: 'Breadsticks',
              quantity: 2,
              price: 2.99,
            ),
          ],
          price: 31.96,
          dateTime: DateTime.now(),
        ),
        Order(
          quantity: 2,
          id: '5',
          products: [
            OrderItem(
              id: '10',
              title: 'Spaghetti Carbonara',
              quantity: 1,
              price: 18.99,
            ),
            OrderItem(
              id: '11',
              title: 'Caesar Salad',
              quantity: 1,
              price: 7.99,
            ),
            OrderItem(
              id: '12',
              title: 'Breadsticks',
              quantity: 2,
              price: 2.99,
            ),
          ],
          price: 31.96,
          dateTime: DateTime.now(),
        ),
        Order(
          quantity: 2,
          id: '5',
          products: [
            OrderItem(
              id: '10',
              title: 'Spaghetti Carbonara',
              quantity: 1,
              price: 18.99,
            ),
            OrderItem(
              id: '11',
              title: 'Caesar Salad',
              quantity: 1,
              price: 7.99,
            ),
            OrderItem(
              id: '12',
              title: 'Breadsticks',
              quantity: 2,
              price: 2.99,
            ),
          ],
          price: 31.96,
          dateTime: DateTime.now(),
        ),
        Order(
          quantity: 2,
          id: '5',
          products: [
            OrderItem(
              id: '10',
              title: 'Spaghetti Carbonara',
              quantity: 1,
              price: 18.99,
            ),
            OrderItem(
              id: '11',
              title: 'Caesar Salad',
              quantity: 1,
              price: 7.99,
            ),
            OrderItem(
              id: '12',
              title: 'Breadsticks',
              quantity: 2,
              price: 2.99,
            ),
          ],
          price: 31.96,
          dateTime: DateTime.now(),
        ),
        Order(
          quantity: 2,
          id: '5',
          products: [
            OrderItem(
              id: '10',
              title: 'Spaghetti Carbonara',
              quantity: 1,
              price: 18.99,
            ),
            OrderItem(
              id: '11',
              title: 'Caesar Salad',
              quantity: 1,
              price: 7.99,
            ),
            OrderItem(
              id: '12',
              title: 'Breadsticks',
              quantity: 2,
              price: 2.99,
            ),
          ],
          price: 31.96,
          dateTime: DateTime.now(),
        ),
      ];
    });
  }

  final String tempUrl =
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg';

  @override
  Widget build(BuildContext context) {
    _totalPrice = _getTotalPrice();
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  final order = _orders[index];
                  return Card(
                    color: Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.px3pt),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: 16.px3pt, vertical: 8.px3pt),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: order.isSelected,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            order.isSelected = value!;
                            bool isAllSelected = true;
                            for (var order in _orders) {
                              if (!order.isSelected) {
                                isAllSelected = false;
                              }
                            }
                            setState(() {
                              _checkAll = isAllSelected;
                            });
                          },
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF6750A4),
                          ),
                          checkColor: const Color(0xFF6750A4),
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey.shade400;
                            }
                            return Colors.white;
                          }),
                        ),
                        const SizedBox(width: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.px3pt),
                          child: Image.network(
                            tempUrl,
                            width: 76.px3pt,
                            height: 76.px3pt,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16.px3pt),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order ${order.id}',
                                style: TextStyle(
                                  fontSize: 16.px3pt,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PoppinsMedium',
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              SizedBox(height: 4.px3pt),
                              for (final item in order.products)
                                Text(
                                  '${item.title}: \$${item.price}',
                                  style: TextStyle(
                                    fontSize: 14.px3pt,
                                    height: 1.5,
                                    fontFamily: 'PoppinsRegular',
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.px3pt),
                    topRight: Radius.circular(16.px3pt)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.16),
                    blurRadius: 16.px3pt,
                    offset: Offset(0, 4.px3pt),
                  ),
                ],
              ),
              padding:
                  EdgeInsets.symmetric(horizontal: 16.px3pt, vertical: 4.px3pt),
              child: Row(
                children: [
                  Checkbox(
                    value: _checkAll,
                    onChanged: (value) {
                      // check all the orders
                      setState(() {
                        for (var order in _orders) {
                          order.isSelected = value!;
                          _checkAll = value;
                        }
                        _getTotalPrice();
                      });
                    },
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.primary),
                  ),
                  const Text(
                    'Select All',
                    style: TextStyle(fontSize: 16, fontFamily: 'RobotoMedium'),
                  ),
                  SizedBox(
                    width: 32.px3pt,
                  ),
                  Text(
                    'Total: \$$_totalPrice',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: 'RobotoMedium',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(right: 16.px3pt, bottom: 4.px3pt),
            color: Theme.of(context).colorScheme.onPrimary,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Pay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.px3pt,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PoppinsSemiBold',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getTotalPrice() {
    double total = 0;
    for (Order order in _orders) {
      if (order.isSelected) {
        // calculate the total price of orderItem
        for (var orderItem in order.products) {
          total += orderItem.price * order.quantity;
        }
        // add the order price
        total += order.price * order.quantity;
      }
    }
    return total.toStringAsFixed(2);
  }
}

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<OrderItem> cartProducts, double total, int quantity) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        products: cartProducts,
        price: total,
        dateTime: DateTime.now(),
        quantity: quantity,
      ),
    );
    notifyListeners();
  }
}

class Order {
  final String id;
  final List<OrderItem> products;
  double price = 0;
  int quantity = 1;
  final DateTime dateTime;
  bool isSelected = false;

  Order({
    required this.id,
    required this.products,
    required this.price,
    required this.dateTime,
    required this.quantity,
  });
}

class OrderItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  OrderItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}
