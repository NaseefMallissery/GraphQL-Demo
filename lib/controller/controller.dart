import 'dart:developer';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:to_do_app/schemas/query.dart';

class Controller extends GetxController {
  // final List allProducts = [].obs;
  //  dynamic product;
  dynamic product;
  static GraphQLClient? _client;

  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  Future getAllProduct() async {
    update();
    try {
      _client = GraphQLProvider.of(Get.context!).value;
      final QueryResult result = await _client!.query(
        QueryOptions(
          document: gql(
            Queries.productsQuery,
          ),
        ),
      );
      if (result.hasException) {
        log(
          result.exception.toString(),
        );
      }
      update();
      if (result.data != null) {
        product = result.data!['products']['edges'] as List;
        update();
      }
    } catch (e) {
      log(
        "Exption $e",
      );
    }
  }
}
