import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatelessWidget {
  final List<WordPair> favirites;

  const FavoriteListPage(
    this.favirites, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite List")),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              favirites[index].asCamelCase,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            color: Colors.grey[300],
            height: 5,
            indent: 16,
            endIndent: 16,
          );
        },
        itemCount: favirites.length,
      ),
    );
  }
}
