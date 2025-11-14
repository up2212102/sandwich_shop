class PricingRepository {
  static const int sixInchPrice = 7;
  static const int footlongPrice = 11;

  int calculateTotal({required int quantity, required bool isFootlong}) {
    final pricePerSandwich = isFootlong ? footlongPrice : sixInchPrice;
    return quantity * pricePerSandwich;
  }
}