import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  // 개별 상품의 총가격 (가격 * 수량)
  double get totalPrice => product.price * quantity;

  // CarItem을 JSON으로 변환 (로컬 저장용)
  Map<String, dynamic> toJson() {
    return {'product': product.toJson(), 'quantity': quantity};
  }

  // JSON에서 CartItem 객체 생성 (로컬 저장 데이터 로드용)
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  // 수량을 변경한 새로운 CartItem을 반환 (불변성 유지)
  CartItem copyWith({int? newQuantity}) {
    return CartItem(product: product, quantity: newQuantity ?? quantity);
  }
}
