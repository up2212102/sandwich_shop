import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich', () {
    test('returns correct name and image for veggie delight footlong', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      expect(sandwich.name, 'Veggie Delight');
      expect(sandwich.image, 'assets/images/veggieDelight_footlong.png');
    });

    test('returns correct name and image for chicken teriyaki six-inch', () {
      final sandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
      expect(sandwich.name, 'Chicken Teriyaki');
      expect(sandwich.image, 'assets/images/chickenTeriyaki_six_inch.png');
    });

    test('returns correct name and image for tuna melt footlong', () {
      final sandwich = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );
      expect(sandwich.name, 'Tuna Melt');
      expect(sandwich.image, 'assets/images/tunaMelt_footlong.png');
    });

    test('returns correct name and image for meatball marinara six-inch', () {
      final sandwich = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.white,
      );
      expect(sandwich.name, 'Meatball Marinara');
      expect(sandwich.image, 'assets/images/meatballMarinara_six_inch.png');
    });
  });
}
