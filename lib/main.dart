import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:to_do_app/constants/api_endpoints/api_url.dart';
import 'package:to_do_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(
        GraphQLClient(
          link: ApiUrl().httpLink,
          cache: GraphQLCache(
            store: InMemoryStore(),
          ),
        ),
      ),
      child: GetMaterialApp(
        title: 'GraphQl Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
