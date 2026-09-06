import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:servicios_modelo/models/category.dart';
import 'package:servicios_modelo/models/product.dart';
import 'package:servicios_modelo/services/product_service.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductService();
});

final categoriesProvider = FutureProvider<List<Category>>((ref) {
  final service = ref.watch(productServiceProvider);
  return service.getCategorys();
});

class SelectedCategory extends Notifier<String?> {
  @override
  String? build() => null;

  void select(String? slug) {
    state = (state == slug) ? null : slug;
  }
}

final selectedCategoryProvider = NotifierProvider<SelectedCategory, String?>(
  SelectedCategory.new,
);

final productProvider = FutureProvider<List<Product>>((ref) {
  final service = ref.watch(productServiceProvider);
  final slug = ref.watch(selectedCategoryProvider);

  return (slug == null)
      ? service.getProducts()
      : service.getProductsByCategory(slug);
});

final productByIdProvider = FutureProvider.family<Product, int>((ref, id) {
  final service = ref.watch(productServiceProvider);
  return service.getProductById(id);
});
