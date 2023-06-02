import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:to_do_app/controller/controller.dart';
import 'package:to_do_app/utils/schemas/query.dart';
import '../utils/loading_widget.dart/loading_widget.dart';

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
      body: Query(
        options: QueryOptions(
          document: gql(
            Queries.productsQuery,
          ),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            log(result.exception.toString());
          }
          if (result.isLoading) {
            return const Center(
              child: LoadingWidget(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.product.length,
                  // controller.allProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.product[index]['node'];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Text(productList[index]['node']['name']),
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: 150,
                            width: 150,
                            child: Image.network(product['thumbnail']['url']),
                          ),
                          Text(
                            product['name'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
