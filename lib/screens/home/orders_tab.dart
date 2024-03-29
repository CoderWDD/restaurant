import 'package:flutter/material.dart';
import 'package:restaurant/constants/assets_constants.dart';
import 'package:restaurant/utils/px2dp.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
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
                    margin: EdgeInsets.symmetric(horizontal: 16.px3pt, vertical: 8.px3pt),
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
                          fillColor: MaterialStateProperty.resolveWith((states) {
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
                                    color: Theme.of(context).colorScheme.secondary,
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
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.px3pt), topRight: Radius.circular(16.px3pt)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.16),
                    blurRadius: 16.px3pt,
                    offset: Offset(0, 4.px3pt),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.px3pt, vertical: 4.px3pt),
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
                    fillColor: MaterialStateColor.resolveWith((states) => Theme.of(context).colorScheme.primary),
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
                foregroundColor: Theme.of(context).colorScheme.onPrimary, backgroundColor: Theme.of(context).colorScheme.primary,
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