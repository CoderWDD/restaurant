
import 'package:flutter/material.dart';

import '../../entities/category.dart';
import '../../entities/dish.dart';


class CanteenDetailsScreen extends StatefulWidget {
  final String canteenName;
  final List<Category> categories;
  final List<Dish> dishes;

  const CanteenDetailsScreen({
    super.key,
    required this.canteenName,
    required this.categories,
    required this.dishes,
  });

  @override
  State<CanteenDetailsScreen> createState() => _CanteenDetailsScreenState();
}

class _CanteenDetailsScreenState extends State<CanteenDetailsScreen> {
  late List<Dish> _filteredDishes;

  @override
  void initState() {
    _filteredDishes = widget.dishes;
    super.initState();
  }

  void _filterDishesByCategory(Category category) {
    setState(() {
      _filteredDishes =
          widget.dishes.where((dish) => dish.categoryId == category.id).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.canteenName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Categories',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 56.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                final category = widget.categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () => _filterDishesByCategory(category),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: Text(category.name),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Dishes',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDishes.length,
              itemBuilder: (context, index) {
                final dish = _filteredDishes[index];
                return ListTile(
                  leading: Image.network(
                    dish.image,
                    height: 64.0,
                    width: 64.0,
                    fit: BoxFit.cover,
                  ),
                  title: Text(dish.name),
                  subtitle: Text(dish.description),
                  trailing: Text('\$${dish.price.toStringAsFixed(2)}'),
                  onTap: () {
                    // Navigate to dish details screen
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
