import 'package:flutter/material.dart';

class CustomSearchedelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const CircularProgressIndicator();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> fruitsss = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        fruitsss.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: fruitsss.length,
      itemBuilder: (BuildContext context, int index) {
        var result=fruitsss[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return const Text('build suggestion');
  }
}
