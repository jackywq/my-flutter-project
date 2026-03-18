import 'product.dart';

class CartItem {
  final Product product;
  int quantity;
  bool isSelected;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.isSelected = true,
  });

  double get totalPrice => product.price * quantity;

  Map<String, dynamic> toMap() {
    return {
      'productId': product.id,
      'productName': product.name,
      'productImage': product.imageUrl,
      'productPrice': product.price,
      'quantity': quantity,
      'isSelected': isSelected,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product(
        id: map['productId'],
        name: map['productName'],
        imageUrl: map['productImage'],
        price: map['productPrice'],
        description: '', // 购物车列表不需要详细描述
      ),
      quantity: map['quantity'],
      isSelected: map['isSelected'],
    );
  }
}
