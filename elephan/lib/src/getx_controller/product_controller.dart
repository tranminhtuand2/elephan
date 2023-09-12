import 'package:elephan/src/services_api/product/product_service.dart';
import 'package:elephan/src/utils/network/response.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    isLoading.value = true;
    var response = await ProductService.fetchProduct();
    if (response is Success) {
      isLoading.value = false;

      List<Product> listProduct = [];
      for (var productItem in response.response.data['data']) {
        Product product = Product.fromMap(productItem);
        listProduct.add(product);
      }
      products.value = listProduct;
    } else {
      isLoading.value = false;
    }
  }
}
