import 'sandwich.dart';
import '../repositories/pricing_repository.dart';

class CartItem {
  final Sandwich sandwich;
  int quantity;

  CartItem({required this.sandwich, required this.quantity});
}

class Cart {
  final List<CartItem> _items = [];
  final PricingRepository _pricingRepository = PricingRepository();

  List<CartItem> get items => List.unmodifiable(_items);

  void addSandwich(Sandwich sandwich, {int quantity = 1}) {
    final existing = _items.where((item) =>
      item.sandwich.type == sandwich.type &&
      item.sandwich.isFootlong == sandwich.isFootlong &&
      item.sandwich.breadType == sandwich.breadType
    ).toList();
    if (existing.isNotEmpty) {
      existing.first.quantity += quantity;
    } else {
      _items.add(CartItem(sandwich: sandwich, quantity: quantity));
    }
  }

  void removeSandwich(Sandwich sandwich) {
    _items.removeWhere((item) =>
      item.sandwich.type == sandwich.type &&
      item.sandwich.isFootlong == sandwich.isFootlong &&
      item.sandwich.breadType == sandwich.breadType
    );
  }

  void updateQuantity(Sandwich sandwich, int quantity) {
    for (var item in _items) {
      if (item.sandwich.type == sandwich.type &&
          item.sandwich.isFootlong == sandwich.isFootlong &&
          item.sandwich.breadType == sandwich.breadType) {
        item.quantity = quantity;
        break;
      }
    }
  }

  int get totalPrice {
    int total = 0;
    for (var item in _items) {
      total += _pricingRepository.calculateTotal(
        quantity: item.quantity,
        isFootlong: item.sandwich.isFootlong,
      );
    }
    return total;
  }

  void clear() {
    _items.clear();
  }
}