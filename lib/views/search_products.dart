import 'package:ele_cart_e_commerce_app/api_calling/controller.dart';
import 'package:ele_cart_e_commerce_app/api_calling/model_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProducts extends StatefulWidget {
  const SearchProducts({Key? key}) : super(key: key);

  @override
  _SearchProductsState createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {
  final productController _productController = Get.put(productController());
  List<ProductModel> displayList = [];
  final ct = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff583D72),
        title: TextField(
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          controller: ct,
          onChanged: (text) {
            setState(() {
              displayList = _productController.productListVar.where((note) {
                var name = note.name.toLowerCase();
                return name.contains(text);
              }).toList();
            });
          },
          decoration: const InputDecoration(
            labelText: 'Search Products',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: ct.text.length == 0
            ? _productController.productListVar.length
            : displayList.length,
        itemBuilder: (BuildContext, index) => Card(
          child: ct.text.length == 0
              ? ListTile(
                  title: Text(_productController.productListVar[index].name),
                  subtitle:
                      Text(_productController.productListVar[index].nameBn),
                  leading: Image.network(
                      _productController.productListVar[index].imagelink),
                )
              : ListTile(
                  title: Text(displayList[index].name),
                  subtitle: Text(displayList[index].nameBn),
                  leading: Image.network(displayList[index].imagelink),
                ),
        ),
      ),
    );
  }
}
