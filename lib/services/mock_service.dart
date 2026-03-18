import '../models/product.dart';

class MockService {
  static List<String> getBanners() {
    return [
      'https://picsum.photos/800/400?random=1',
      'https://picsum.photos/800/400?random=2',
      'https://picsum.photos/800/400?random=3',
    ];
  }

  static List<Map<String, dynamic>> getCategories() {
    return [
      {'name': '手机', 'icon': '📱'},
      {'name': '电脑', 'icon': '💻'},
      {'name': '服饰', 'icon': '👕'},
      {'name': '食品', 'icon': '🍔'},
      {'name': '图书', 'icon': '📚'},
      {'name': '运动', 'icon': '🏀'},
      {'name': '美妆', 'icon': '💄'},
      {'name': '家居', 'icon': '🏠'},
    ];
  }

  static List<Product> getProducts() {
    return List.generate(20, (index) {
      return Product(
        id: 'p_$index',
        name: '商品名称 $index',
        imageUrl: 'https://picsum.photos/200/200?random=${index + 10}',
        price: (index + 1) * 100.0,
        description: '这是商品 $index 的详细描述，物美价廉，值得购买。',
      );
    });
  }

  static Product getProductById(String id) {
    return getProducts().firstWhere(
      (p) => p.id == id,
      orElse: () => Product(
        id: id,
        name: '未知商品',
        imageUrl: 'https://picsum.photos/200/200',
        price: 0,
        description: '未找到该商品',
      ),
    );
  }
}
