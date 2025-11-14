import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    final repo = PricingRepository();

    test('calculates total for six-inch', () {
      expect(repo.calculateTotal(quantity: 2, isFootlong: false), 14);
    });

    test('calculates total for footlong', () {
      expect(repo.calculateTotal(quantity: 3, isFootlong: true), 33);
    });

    test('zero quantity returns zero', () {
      expect(repo.calculateTotal(quantity: 0, isFootlong: true), 0);
      expect(repo.calculateTotal(quantity: 0, isFootlong: false), 0);
    });
  });
}