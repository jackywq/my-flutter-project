import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartService extends ChangeNotifier {
  final Box _box;
  List<CartItem> _items = [];

  CartService(this._box) {
    _loadItems();
  }

  List<CartItem> get items => _items;

  double get totalPrice {
    return _items
        .where((item) => item.isSelected)
        .fold(0, (total, item) => total + item.totalPrice);
  }

  int get totalCount {
    return _items.fold(0, (count, item) => count + item.quantity);
  }

  bool get isAllSelected =>
      _items.isNotEmpty && _items.every((item) => item.isSelected);

  void _loadItems() {
    final List<dynamic>? storedItems = _box.get('items');
    if (storedItems != null) {
      _items = storedItems
          .map((e) => CartItem.fromMap(Map<String, dynamic>.from(e)))
          .toList();
      notifyListeners();
    }
  }

  Future<void> _saveItems() async {
    final List<Map<String, dynamic>> itemsMap = _items
        .map((e) => e.toMap())
        .toList();
    await _box.put('items', itemsMap);
    notifyListeners();
  }

  Future<void> addToCart(Product product, {int quantity = 1}) async {
    final existingIndex = _items.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }
    await _saveItems();
  }

  Future<void> removeFromCart(String productId) async {
    _items.removeWhere((item) => item.product.id == productId);
    await _saveItems();
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
      await _saveItems();
    }
  }

  Future<void> toggleSelection(String productId) async {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index].isSelected = !_items[index].isSelected;
      await _saveItems();
    }
  }

  Future<void> toggleAllSelection(bool value) async {
    for (var item in _items) {
      item.isSelected = value;
    }
    await _saveItems();
  }

  Future<void> clearCart() async {
    _items.clear();
    await _saveItems();
  }
}
