import 'package:flutter/material.dart';

class CustomSearchelegate extends SearchDelegate{


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
      query='';
    }, icon: const Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}