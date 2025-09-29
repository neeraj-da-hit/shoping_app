import 'package:get/get.dart';
import 'package:shoping_api/model/product_model.dart';
import 'package:shoping_api/services/products_service.dart';

class ProductController extends GetxController {
  final ProductsService _service = ProductsService();

  // Observables
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      final products = await _service.fetchProducts();
      productList.assignAll(products);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
