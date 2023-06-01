import 'package:flutter/material.dart';

class AddToCartDialog extends StatefulWidget {
  final void Function(String flavor, int quantity) onAddToCart;

  const AddToCartDialog({Key? key, required this.onAddToCart})
      : super(key: key);

  @override
  State<AddToCartDialog> createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  final TextEditingController _flavorController = TextEditingController();
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Add to Cart'),
      contentPadding: const EdgeInsets.all(16),
      children: [
        TextFormField(
          controller: _flavorController,
          decoration: InputDecoration(
            labelText: 'Flavor description',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          maxLength: 100,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Quantity:'),
            CounterButton(
              value: _quantity,
              onIncrement: () => setState(() => _quantity++),
              onDecrement: () => setState(
                  () => _quantity = _quantity > 1 ? _quantity - 1 : _quantity),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            widget.onAddToCart(_flavorController.text, _quantity);
            Navigator.of(context).pop();
          },
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }
}

class CounterButton extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterButton(
      {Key? key,
      required this.value,
      required this.onIncrement,
      required this.onDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: onDecrement,
        ),
        Text('$value'),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}

// a stateFulWidget about the dialog of delete item from cart
class DeleteItemDialog extends StatefulWidget {
  final String text;
  final VoidCallback onDelete;
  const DeleteItemDialog({Key? key, required this.text, required this.onDelete}) : super(key: key);

  @override
  State<DeleteItemDialog> createState() => _DeleteItemDialogState();
}

class _DeleteItemDialogState extends State<DeleteItemDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Item'),
      content:
          Text(widget.text ?? 'Are you sure you want to delete this item?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: (){
            widget.onDelete();
            Navigator.of(context).pop();
          },
          child: const Text('Delete'),
        )
      ],
    );
  }
}
