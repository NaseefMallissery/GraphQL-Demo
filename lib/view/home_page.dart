import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controller/controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // controller.isLoading.isTrue
            //     ? const LoadingWidget()
            //     :
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                  ),
                  itemCount: controller.allProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.allProducts[index]['node'];
                    return Column(
                      children: [
                        Text(
                          product['name'],
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
