import 'package:ecommerce_app_design/views/payment_method_screen.dart';
import 'package:ecommerce_app_design/widget/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductController extends GetxController {
  var currentPage = 0.obs; // Observable for the current page index
  var isHeartSelected = false.obs; // Observable for heart icon state
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());

    final List<String> _imagePaths = [
      'assets/images/air1.png',
      'assets/images/air1.png',
      'assets/images/air1.png',
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF433FFF).withOpacity(0.7),
                Colors.cyan.withOpacity(0.6),
                Colors.white.withOpacity(0.5),
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(), // Use GetX for navigation
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    Expanded(child: Searchbar()),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          onPressed: () {}, // Add action for info button
                          icon: Icon(Icons.info, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            itemCount: _imagePaths.length,
                            onPageChanged: (index) {
                              controller.currentPage.value = index; // Update current page index
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Image.asset(
                                  _imagePaths[index],
                                  width: 500,
                                  height: 500,
                                ),
                              );
                            },
                          ),
                        ),
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _imagePaths.length,
                                (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: Container(
                                  width: 15,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: controller.currentPage.value == index ? Colors.black : Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 300),
                          child: Obx(() => GestureDetector(
                            onTap: () {
                              controller.isHeartSelected.value = !controller.isHeartSelected.value; // Toggle heart selection
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.favorite,
                                color: controller.isHeartSelected.value ? Colors.red : Colors.grey,
                              ),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Noise Buds VS104',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Truly Wireless Earbuds',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Text(
                          "699₹",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(right: 280),
                    child: Text(
                      "Color",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ColorOption(color: Colors.red),
                      ColorOption(color: Colors.blue),
                      ColorOption(color: Colors.grey),
                      ColorOption(color: Colors.black),
                    ],
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {}, // Add action for Add to Cart button
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                          child: Text('Add to Cart'),
                        ),
                        SizedBox(width: 16),
                        InkWell(
                          onTap: () {
                           Get.to( PaymentMethodScreen ());
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.cyan,
                                  Color(0xFF433FFF),
                                ], // Gradient colors
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;

  const ColorOption({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

