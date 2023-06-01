import 'dart:developer';

import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:to_do_app/schemas/query.dart';

class Controller extends GetxController {
  RxBool isLoading = false.obs;
  final RxList allProducts = [].obs;
  static GraphQLClient? _client;

  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  Future getAllProduct() async {
    try {
      _client = GraphQLProvider.of(Get.context!).value;
      final QueryResult result = await _client!.query(
        QueryOptions(
          document: gql(Queries.productsQuery),
        ),
      );
      if (result.hasException) {
        log(result.exception.toString());
      }
      update();
      if (result.data != null) {
        final product = result.data!['products']['edges'];
        allProducts.add(product);
        update();
      }
    } catch (e) {
      log("Exption $e");
    }
  }
}
