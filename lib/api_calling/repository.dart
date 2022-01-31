import 'package:ele_cart_e_commerce_app/api_calling/model_category.dart';
import 'package:ele_cart_e_commerce_app/api_calling/model_products.dart';
import 'package:ele_cart_e_commerce_app/api_calling/model_slider.dart';
import 'package:http/http.dart' as http;

class ProductList {
  static Future<List<ProductModel>?> getProduct() async {
    print("Print product from repository");

    String url = "https://api.ishaqi.com/products";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      print(response.body);
      return ProductModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<SliderModel>?> getSlider() async {
    print("Print slider from repository");

    String url = "https://api.ishaqi.com/posts/slider";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      print(response.body);
      return sliderModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<CategoryModel>?> getCategory() async {
    print("Print slider from repository");

    String url = "https://api.ishaqi.com/categories";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      print(response.body);
      return categoryModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
