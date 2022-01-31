import 'package:ele_cart_e_commerce_app/api_calling/model_category.dart';
import 'package:ele_cart_e_commerce_app/api_calling/model_products.dart';
import 'package:ele_cart_e_commerce_app/api_calling/model_slider.dart';
import 'package:ele_cart_e_commerce_app/api_calling/repository.dart';
import 'package:get/get.dart';

class productController extends GetxController {
  var productListVar = List<ProductModel>.empty().obs;
  var sliderListVar = List<SliderModel>.empty().obs;
  var categoryListVar = List<CategoryModel>.empty().obs;
  var isLoadingProduct = true.obs;
  var isLoadingSlider = true.obs;
  var isLoadingCategory = true.obs;

  void fatchProductData() async {
    print("Calling Products");

    try {
      isLoadingProduct(true);

      var productData = await ProductList.getProduct();

      if (productData != null) {
        productListVar.value = productData;
      }
    } finally {
      isLoadingProduct(false);
    }
  }

  void fatchSliderData() async {
    print("Calling Slider");

    try {
      isLoadingSlider(true);

      var sliderData = await ProductList.getSlider();

      if (sliderData != null) {
        sliderListVar.value = sliderData;
      }
    } finally {
      isLoadingSlider(false);
    }
  }

  void fatchCategoryData() async {
    print("Calling Category");

    try {
      isLoadingCategory(true);

      var categoryData = await ProductList.getCategory();

      if (categoryData != null) {
        categoryListVar.value = categoryData;
      }
    } finally {
      isLoadingCategory(false);
    }
  }
}
