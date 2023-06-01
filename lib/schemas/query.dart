class Queries {
  static const productsQuery = '''
query products{
  products(first: 15, channel: "default-channel") {
    edges {
      node {
        id
        name
        description
        thumbnail {
          url
        }
      }
    }
  }
}
''';
}
