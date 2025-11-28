import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    late Cart cart;
    late Sandwich sandwich1;
    late Sandwich sandwich2;

    setUp(() {
      cart = Cart();
      sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
    });

    test('addSandwich adds a new item', () {
      cart.addSandwich(sandwich1);
      expect(cart.items.length, 1);
      expect(cart.items.first.sandwich, sandwich1);
      expect(cart.items.first.quantity, 1);
    });

    test('addSandwich increases quantity for same sandwich', () {
      cart.addSandwich(sandwich1);
      cart.addSandwich(sandwich1);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 2);
    });

    test('removeSandwich removes the item', () {
      cart.addSandwich(sandwich1);
      cart.removeSandwich(sandwich1);
      expect(cart.items.length, 0);
    });

    test('updateQuantity changes the quantity', () {
      cart.addSandwich(sandwich1);
      cart.updateQuantity(sandwich1, 5);
      expect(cart.items.first.quantity, 5);
    });

    test('totalPrice calculates correct total', () {
      cart.addSandwich(sandwich1, quantity: 2); // footlong: 11 each
      cart.addSandwich(sandwich2, quantity: 3); // six-inch: 7 each
      expect(cart.totalPrice, 2 * 11 + 3 * 7);
    });

    test('clear removes all items', () {
      cart.addSandwich(sandwich1);
      cart.addSandwich(sandwich2);
      cart.clear();
      expect(cart.items.length, 0);
    });
  });
}
