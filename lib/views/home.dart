import 'package:ele_cart_e_commerce_app/api_calling/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final productController _productController = Get.put(productController());
  late PageController _pageController;

  List<Widget> indicators(imagesLength, currentIndex) {
    return List.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 20,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    _productController.fatchProductData();
    _productController.fatchSliderData();
    _productController.fatchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          if (_productController.isLoadingSlider.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 130,
              child: PageView.builder(
                itemCount: _productController.sliderListVar.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.network(_productController
                        .sliderListVar[pagePosition].imagelink),
                  );
                },
              ),
            );
          }
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              indicators(_productController.sliderListVar.length, activePage),
        ),
        SizedBox(
          height: 100,
          child: Obx(() {
            if (_productController.isLoadingProduct.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _productController.productListVar.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Color(0xffFFC996),
                  child: SizedBox(
                    width: 200,
                    child: Center(
                      child: ListTile(
                        title: Text(
                          _productController.categoryListVar[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            _productController.categoryListVar[index].nameBn),
                        leading: Image.network(_productController
                            .categoryListVar[index].imagelink),
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
        ),
        Container(
            color: const Color(0xff583D72),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: const Center(
                child: Text(
              "All Products",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ))),
        Expanded(
          child: Obx(() {
            if (_productController.isLoadingProduct.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: _productController.productListVar.length,
                itemBuilder: (BuildContext, index) => Card(
                  child: ListTile(
                    title: Text(_productController.productListVar[index].name),
                    subtitle:
                        Text(_productController.productListVar[index].nameBn),
                    leading: Image.network(
                        _productController.productListVar[index].imagelink),
                    trailing: const Icon(
                      Icons.shopping_cart,
                      color: Color(0xffFF8474),
                    ),
                  ),
                ),
              );
            }
          }),
        ),
      ],
    );
  }
}
